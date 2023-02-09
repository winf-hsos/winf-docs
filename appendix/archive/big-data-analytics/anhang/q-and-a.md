---
description: >-
  Hier findet ihr die Fragen und Antworten, die während des Semesters gestellt
  wurden.
---

# Q & A

## Ich bekomme eine Fehlermeldung beim Laden der Daten. Es konnte eine Tabelle nicht angelegt werden, weil sie bereits existiert. Wie löse ich das?

Die Fehlermeldung dazu lautet so (oder so ähnlich):&#x20;

```bash
org.apache.spark.sql.AnalysisException: Can not create the managed table('twitter_followers'). The associated location('dbfs:/user/hive/warehouse/twitter_followers') already exists.
```

Die Lösung  funktioniert in 2 Schritten:

**Schritt 1: Ermitteln des genauen Pfades**

```scala
// Ersetzt hier den Pfad aus eurer Fehlermeldung
display(dbutils.fs.ls("dbfs:/user/hive/warehouse/twitter_followers"))
```

Als Ergebnis bekommt ihr einen detaillierteren Pfad angezeigt. Diese müsst ihr für den zweiten Schritt der Lösung kopieren.

**Schritt 2: Löschen der alten Datei**

Ersetzt den zuvor kopieren Pfad im Aufruf unten.

```scala
dbutils.fs.rm("dbfs:/user/hive/warehouse/twitter_followers/_started_1560150859916745977")
```

Nun versucht erneut, die Daten neu zu laden. Es sollte alles funktionieren.

#### Mehr als eine Datei oder Ordner?

Sollten sich im Verzeichnis mehrere Dateien oder Ordner befinden so muss beim Löschen ein zweiter Parameter gesetzt werden. Dieser sorgt dafür, dass alles in dem Ordner rekursiv gelöscht wird:

```scala
dbutils.fs.rm("dbfs:/user/hive/warehouse/twitter_followers", true)
```

## Ist es möglich, Tweets auf mehrere Schlagwörter zu untersuchen, indem man ein Array mit den Schlagwörtern anlegt und dann nach dem Array sucht? Ziel ist ein Ranking der Tweets nach Relevanz.

Es ist nicht möglich, nach einem Array zu suchen. Ihr könnt aber die Texte in einzelne Wörter zerlegen, wie wir es in der Veranstaltung gemacht haben, und anschließend in dem Ergebnis nach einer Menge an Schlagwörtern suchen. Beispiel:

**Anlegen einer Hilfstabelle mit Schlagwörtern:**

Alternativ auch über Google Sheets. Dazu siehe auch [das passende Tutorial](../../nlp-with-sql/identify-topics-in-text/mapping-tables-with-sql.md):

```scala
// Hier einfach in die Wörter durch eure ersetzen
val list = Seq("organic", "environment", "quality");

// Die einzige Spalte wird hier "word" genannt (gerne umbenennen)
val df = sc.parallelize(list).toDF("word");

// Zum Schluss wird ein temporärer View erzeugt mit dem Namen "keyword"
df.createOrReplaceTempView("keywords");
```

Mit der Tabelle `keywords` könnt ihr auf dem Ergebnis der vorbereiteten Texte (in Wörter zerlegt) wie folgt arbeiten. Ich gehe davon aus, dass der View `tweets_prep_step_4` das Ergebnis des 4. Schrittes ist (POS Tagging ist hier ausgenommen):

```sql
select * from tweets_prep_step_4 t
left join keywords k 
  on t.word = k.word
-- Nur Tweets, die eines der Keywords beinhalten
where k.word is not null
```

Um nun noch das Vorkommen der Keyword in den Tweets zu zählen und pro Tweet nur eine Zeile zu erhalten, können wir das Ergebnis aggregieren:

```sql
select id, count(1) as `Number Keywords` 
from tweets_prep_step_4 t
left join keywords k 
  on t.word = k.word
-- Nur Tweets, die eines der Keyword beinhalten
where k.word is not null
group by id
-- Nach Anzahl der Keywords sortieren
order by `Number Keywords` desc
```

Um die Information zu behalten, welche Keywords gefunden wurden, können wir die SQL Funktion collect\_list verwenden, die uns die Keywords als Array aggregiert:

```sql
select id
      ,count(1) as `Number Keywords` 
      ,collect_list(k.word)
      ,original_text
from tweets_prep_step_4 t
left join keywords k 
  on t.word = k.word
-- Nur Tweets, die eines der Keyword beinhalten
where k.word is not null
group by id, original_text
order by `Number Keywords` desc
```

{% hint style="info" %}
**Hinweis**: Die Spalten `id` und `original_text` sind im Beispiel aus der Veranstaltung nicht Teil der Views gewesen. Damit die Statement oben funktionieren müsst ihr diese Spalten in jedem der Views nachziehen. Das Template habe ich entsprechend aktualisiert.
{% endhint %}

## Befindet sich in der "Tweet-ID" auch die "User-ID" - ist diese dort mit eingebunden?

Nein, aber ihr könnt zu einem Tweet mittels eines JOIN einfach die User-ID ermitteln:

```sql
select tl.id, tf.id from twitter_timelines tl
left join twitter_followers tf
  on tf.follower_of = tl.user
```

## Wie wandelt man einen String in eine Zahl um?

In manchen Fällen wissen wir, dass eine Spalte zwar Zahlen _enthält,_ der Datentyp ist aber trotzdem ein String. Das kann z.B. am Import der Daten liegen. Um trotzdem mit dieser Spalte rechnen zu können und um diese Spalte numerisch sortieren zu können, müssen wir sie in eine Zahl umwandeln. Das funktioniert in SQL mit der `cast`-Funktion.

```sql
-- Spalten und Datentypen ausgeben
describe organic_uk
```

Wir sehen als Ergebnis, dass die Spalte `HEADLINE` vom Typ String ist, wir wissen aber, das dort nur Zahlen enthalten sind. Daher wandeln wir um:

```sql
select HEADLINE
      ,cast(COMMENT_COUNT as int) as `Anzahl Kommentare`
from organic_uk
order by `Anzahl Kommentare` desc
```

## Wie extrahiert man Strings aus einem Array?

Zu diesem Thema verweise ich auf das Tutorial unten. Diese Frage wird konkret an [dieser Stelle](../../sql-advanced/json-and-sql.md#arrays-mit-sql-abfragen) beantwortet:

{% content-ref url="../../sql-advanced/json-and-sql.md" %}
[json-and-sql.md](../../sql-advanced/json-and-sql.md)
{% endcontent-ref %}

## Wie entfernt man doppelte Tweets aus dem Datensatz?

Die Frage ist im Tutorial [Twitter-Daten mit SQL auswerten](broken-reference) adressiert.

{% content-ref url="broken-reference" %}
[Broken link](broken-reference)
{% endcontent-ref %}
