# JSON and SQL

{% hint style="info" %}
This section is outdated and will updated soon.
{% endhint %}

## Lernziele

In diesem Tutorial geht es um die Verwendung von SQL im Zusammenhang mit dem JSON-Datenformat. JSON ist kurz für _Javascript Object Notation_ und ist ein gängiges Format für den Austausch von Daten, speziell im Umfeld des Internet. Wenn ihr das Format selbst noch nicht kennt, solltet ihr zuerst das Tutorial [Einführung in JSON](broken-reference) absolvieren:

{% content-ref url="broken-reference" %}
[Broken link](broken-reference)
{% endcontent-ref %}

Im Gegensatz zu herkömmlichen Spalten mit atomaren Werten können die Daten in einer Spalte im JSON-Format eine eigene Struktur besitzen. So kann innerhalb einer Spalte eine ganze Liste oder eine Hierarchie an Informationen gespeichert werden. SQL ist ursprünglich nicht für dieses Datenformat entwickelt worden. Es gibt aber in den meisten SQL-Implementierungen und speziell in dem von uns eingesetzten Spark SQL mittlerweile Funktionen für dieses spezielle Datenformat. Ziel dieses Tutorials ist es, die wichtigsten davon anhand von Beispielen kennenzulernen.

## Daten für das Tutorial

Für dieses Tutorial verwenden wir den Amazon Reviews Datensatz für _Grocery and Gourmet Food_. Damit ihr die Daten möglichst einfach in euren Databricks Account laden könnt, stelle ich ein Template für dieses Tutorial bereit:

* JSON-Felder mit SQL verarbeiten - Template&#x20;

## Welche Spalten sind betroffen?

Als erstes müssen wir lernen, wie wir Spalten mit JSON-Daten überhaupt erkennen? Dazu können wir den `describe` Befehl nutzen. Unten im Screenshot seht ihr das Ergebnis für die Tabelle `meta_Grocery_and_Gourmet_Food` . Die rot markierten Zeilen sind Spalten mit JSON-Datentypen.

Immer wenn wir den Begriff `array<...>` als Datentyp einer Spalte sehen wissen wir, dass es sich um **eine Liste von Werten** handelt, in der jeder Wert einen Index (Position) innerhalb der Liste hat. Es handelt sich also um eine sortierte Liste. Im Beispiel unten handelt es sich sogar um ein verschachteltes Array: Eine Liste von Listen von Strings. Wie man mit Array und verschachtelten Array in SQL umgehen kann schauen wir uns [weiter unten](json-and-sql.md#arrays-abfragen) an.

Im zweiten Beispiel mit der Spate `related` sehen wir das Schlüsselwort `struct<...>`. Hierbei handelt sich nicht um ein Array, sondern **um ein Objekt**. Ein Objekt ist ein strukturierter Datentyp, der selbst weitere Felder (oder Attribute) hat, die wir über ihre Namen ansprechen können. Im Beispiel unten hat ein Wert in der Spalte `related` die Felder `also_bought`, `also_viewed`, `bought_together` und `buy_after_viewing`. Alle diese Felder sind wiederum vom Typ `array<string>`, was eine Liste von Strings bedeutet. Ihr seht schon, die Struktur einer JSON-Spalte kann beliebig tief geschachtelt sein. Wie man mit Objekten umgeht [schauen wir uns ebenfalls gleich an](json-and-sql.md#objekte-und-deren-attribute-abfragen).

![Beispiele für Felder mit Strukturen bzw. JSON-Datentyp](<../../../.gitbook/assets/image (48) (1).png>)

## Arrays abfragen

### Array-Spalten anzeigen und verstehen

Um zu lernen, wie wir mit Arrays umgehen können, schauen wir uns die Spalte `categories` genauer an. In der Abbildung unten haben wir nur diese Spalte selektiert und wir sehen das Ergebnis unter dem SQL Statement.

Ohne eine Aktion von uns wird eine Spalte vom Typ Array immer dargestellt wie im ersten Beispiel unten im Screenshot. Die eckigen Klammern signalisieren und das Array, und in diesem Fall sehen wir sogar zwei eckige Klammern hintereinander. Das bedeutet es handelt sich - wie oben beschrieben - um ein Array in einem Array, oder eine Liste von Listen.

Um die Daten genauer zu untersuchen haben wir die Möglichkeit, über den kleinen Pfeil die Struktur der Daten wie in einer Baumstruktur aufzuklappen. Wir sehen so jedes Array und seine Elemente an den jeweiligen Positionen (Index), beginnend bei 0.

****:bulb: **Die erste Position in einem Array ist immer die Position 0.**

Wie aber können wir diese Spalte mit SQL abfragen?

![](<../../../.gitbook/assets/image (32).png>)

### Arrays mit SQL abfragen

Beim Umgang mit Arrays gibt es im Wesentlichen drei Fragen, die wir uns häufig stellen und für die wir eine Lösung mit SQL benötigen:

1. Wie kann ich ein bestimmtes Element aus dem Array abfragen? Also z.B. das erste oder letzte Element?
2. Wie kann ich die Array-Spalte in einzelne Zeilen zerlegen, um Abfragen auf den einzelnen Elementen durchführen zu können?
3. Wie kann ich schnell prüfen, ob ein bestimmtes Element (z.B. ein String) als Element in einem Array vorkommt?

Die erste Frage lässt sich schnell beantworten:

```sql
-- Zugriff auf das erste Element des Arrays über den Index 0
select categories[0] from meta_Grocery_and_Gourmet_Food

-- Zugriff auf das zweite Element des Arrays über den Index 1
select categories[1] from meta_Grocery_and_Gourmet_Food

-- Zugriff auf das letzte Element des Array über die Länge des Arrays
select categories[size(categories) -1] from meta_Grocery_and_Gourmet_Food

-- Die Länge eines Arrays bekommt man mit der size() Funktion
select size(categories) from meta_Grocery_and_Gourmet_Food
```

Häufig ist es nützlich, die Werte eines Array in Zeilen zu zerlegen. Anstatt einer Zeile mit einem Array der Länge 3 (z.B. wenn ein Produkt zu 3 Kategorien gehört), hat man dann im Ergebnis 3 Zeilen mit jeweils einem Wert für die Kategorie des Produkts:

```sql
-- explode() zerlegt die Werte eines Arrays in einzelne Zeilen
select explode(categories) from meta_Grocery_and_Gourmet_Food
```

Um den Unterschied vor und nach der Anwendung von explode zu verdeutlichen, könnt ihr folgendes SQL ausführen:

```sql
select title, explode(categories), categories 
from meta_Grocery_and_Gourmet_Food
where size(categories) > 1
```

Das Ergebnis seht ihr unten im Screenshot:

![](<../../../.gitbook/assets/image (33).png>)

### Numerische Arrays summieren (ohne `explode()`)

Wenn entweder die Elemente eines Arrays allesamt numerisch sind, oder jedes Element einen numerischen Wert enthält (im Falle eines Arrays von Objekten), so gibt es eine einfache Möglichkeit, die Summe über alle Elemente im Array zu bilden.&#x20;

Im Folgenden erzeugen wir zuerst einen fiktiven View, der eine Spalte vom Typ Array enthält. In diesem Array sind nur Zahlen enthalten, die wir in einem weiteren SQL Statement aufsummieren wollen. Dazu nutzen wir die `aggregate()` Funktion.

```sql
create or replace view test as
select array(1.22, 1.3, 4.0) as myArray
union
select array(0.35, 10.5, 3.14) as myArray
```

Nun wenden wir die `aggregate` Funktion in einem SQL Statement an:

```sql
select aggregate(cast(myArray as array<double>), 0.0D,  (acc, item) -> acc + item) as `Summe des Array`
from arraySumTest
```

Es ist bei der Anwendung der Funktion wichtig zu beachten, dass die ersten beiden Argumente vom gleichen Typ sind. Das Array `myArray` wird daher in ein Array vom Type `double` umgewandelt und auch der Startwert für die Aggregation als `0.0D` angegeben. Das bedeutet, die 0.0 soll ebenfalls als Zahl vom Typ `double` interpretiert werden.

## Objekte und deren Attribute abfragen

Folgt bald.
