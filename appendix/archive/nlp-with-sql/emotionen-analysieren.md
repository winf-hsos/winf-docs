---
description: >-
  In diesem Abschnitt schauen wir uns an, wie wir systematisch Emojis aus Tweets
  auslesen und auswerten können.
---

# Emoticons

## :bulb: Emotionen über Emojis identifizieren

Eine einfache Möglichkeit nach Emojis zu suchen ist die Verwendung des `LIKE` Operators:

```sql
select text, * from twitter_timelines
where text like '%😂%'
```

Damit kann Texte zumindest nach dem Vorkommen einzelner Emojis hin untersuchen. Das reicht aber für erweiterte Analysen nicht aus. Besser wäre es, wenn wir aus den Texten (hier: Tweets) mit einem Befehl alle Emojis extrahieren könnten und mit einer Tabelle bekannter Emojis und deren Bedeutung abgleichen könnten. Wie das geht beschreibe ich im Folgenden.

### :bulb: Emojis mit Scala und UDFs extrahieren

#### Emoticons extrahieren

In Databricks können wir neben SQL auch Scala verwenden. Scala ist die Programmiersprache, mit der Apache Spark entwickelt wurde (Spark SQL ist ein Teil von Apache Spark). In Scala ist es mit einem Befehl über einen regulären Ausdruck möglich, alle Emojis zu extrahieren. Wir verpacken die Zeile noch in eine neue Funktion oder _User Defined Function (UDF)_, so dass wir sie anschließend auch aus SQL heraus aufrufen können:

```scala
def findEmoticons(s: String): Array[String] = {
  val str = Option(s).getOrElse(return Array())
   """\p{block=Emoticons}""".r.findAllIn(str).toArray 
}

val findEmoticonsUDF = udf[Array[String], String](findEmoticons)
spark.udf.register("findEmoticons", findEmoticonsUDF)
```

#### Emoticons und sonstige Symbole extrahieren

Neben den älteren Emojis gibt es mittlerweile eine ganze Reihe weiterer Symbole, die ebenfalls erkannt werden können. Dazu müssen lediglich die [Unicode-Blöcke](https://www.w3.org/TR/xsd-unicode-blocknames/) _Dingbats_ und _Miscellaneous Symbols and Pictographs_ zusätzlich zum Block _Emoticons_ hinzugefügt werden:

```scala
def findEmoticons(s: String): Array[String] = {
  val str = Option(s).getOrElse(return Array())
   """[\p{block=Emoticons}\p{block=Dingbats}\p{block=Miscellaneous Symbols And Pictographs}]""".r.findAllIn(str).toArray 
}

val findEmoticonsUDF = udf[Array[String], String](findEmoticons)
spark.udf.register("findEmoticons", findEmoticonsUDF)
```

### :bulb: Emojis mit SQL analysieren

Die Zeile 2 sorgt dafür, dass die neue Funktion `findEmoticons` auch in SQL verfügbar ist. Wir können sie dann einfach auf die Spalte `text` anwenden:

```sql
select text, findEmoticons(text) as `emojis` 
from twitter_timelines
where size(findEmoticons(text)) > 0
```

Das Ergebnis der Funktion ist eine neue Spalte als Liste (Array) von Emojis:

![](<../../../.gitbook/assets/image (28).png>)

Wie wir mit Arrays in SQL umgehen ist bekannt bzw. könnt ihr im [dafür vorgesehenen Tutorial](../sql-advanced/json-and-sql.md#arrays-abfragen) nachlesen. Wir können z.B. `explode` anwenden, um pro Zeile ein Emojis zu erhalten:

```sql
select text, explode(emojis) as emoji
from (
  select text, findEmoticons(text) as `emojis` 
  from twitter_timelines
)
```

Der Vorteil, dass wir genau einen Emoji in einer Spalte haben, liegt auf der Hand: Wir können z.B. die neue Spalte `emoji` nutzen, um die Daten mit einer Liste von bekannten Emojis und deren Bedeutung zu verbinden. Diese Liste können wir uns z.B. selbst als Google Spreadsheet aufbauen, oder wir suchen nach einer solchen Liste im Internet.&#x20;

Zur Demonstration habe ich eine Liste mit einigen Emojis und deren emotionaler Bedeutung in Google Spreadsheets angelegt, die ihr wie folgt laden könnt (wie ihr generell eigene Google Spreadsheets als Tabelle laden könnt ist [hier](identify-topics-in-text/mapping-tables-with-sql.md#tabellen-ueber-google-sheets-pflegen-und-laden) beschrieben):

```scala
// Choose a name for your resulting table in Databricks
var tableName = "emoji_meaning"

// Replace this URL with the one from your Google Spreadsheets
// Click on File --> Publish to the Web --> Option CSV and copy the URL
var url = "https://docs.google.com/spreadsheets/d/e/2PACX-1vTqChTs7Na_R4x3v-2z3BCpnazVhgyDtxHApJag0k4IGekU_74gqA8Vg-OzXRLUlYD4BPtH2rJ1Okpt/pub?output=csv"

var localpath = "/tmp/" + tableName + ".csv"
dbutils.fs.rm("file:" + localpath)
"wget -O " + localpath + " " + url !!

dbutils.fs.mkdirs("dbfs:/datasets/gsheets")
dbutils.fs.cp("file:" + localpath, "dbfs:/datasets/gsheets")

sqlContext.sql("drop table if exists " + tableName)
var df = spark.read.option("header", "true").option("inferSchema", "true").csv("/datasets/gsheets/" + tableName + ".csv");
df.write.saveAsTable(tableName);
```

Nach dem Ausführen des obigen Blocks habt ihr die neue Tabelle `emoji_meaning` in eurem Databricks Account:

```sql
select * from emoji_meaning
```

![](<../../../.gitbook/assets/image (57).png>)

Jetzt müssen wir die beiden Tabellen nur noch zusammenbringen:

```sql
select t.text, t.emoji, e.meaning
from (
  select text, explode(findEmoticons(text)) as `emoji` 
  from twitter_timelines
) t
-- Left join um auch Emojis ohne Eintrag in Bedeutungstabelle zu bekomen
left join emoji_meaning e
  on e.emoji = t.emoji
```

![](<../../../.gitbook/assets/image (11).png>)

### :bulb: Fehlende Emojis pflegen

Wie wir schnell erkennen können haben einige Zeilen in der Spalte meaning den Wert null. Das bedeutet wir haben in unserer Tabelle emoji\_meaning, also im Google Spreadsheet, diesen Emoji noch nicht mit einer Bedeutung versehen. Das können wir nun nachholen, die Tabelle neu laden, und das obige Statement erneut ausführen. Um möglichst schnell auf die fehlenden Emojis zu stoßen können wir das Ergebnis entsprechend filtern:

```sql
select t.text, t.emoji, e.meaning
from (
  select text, explode(findEmoticons(text)) as `emoji` 
  from twitter_timelines
) t
left join emoji_meaning e
  on e.emoji = t.emoji
where e.meaning is null
```

Viel Spaß beim Analysieren!

## :link: Links

{% embed url="https://unicode.org/emoji/charts/full-emoji-list.html" %}

{% embed url="http://www.emojitracker.com/" %}

