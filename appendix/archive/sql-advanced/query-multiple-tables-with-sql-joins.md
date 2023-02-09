# Multiple Tables

## Databricks Notebook

In this notebook, you'll learn about the different types of joins operations using a simple and illustrative example data set:

{% embed url="https://winf-hsos.github.io/databricks-notebooks/information-management/Example%20Notebook%20-%20SQL%20Joins.html" %}

## Lernziele

* Ihr kennt die Möglichkeit, mittels Joins zwei oder mehrere Tabellen in einer SQL-Abfrage miteinander zu verknüpfen.
* Ihr kennt die unterschiedlichen Typen von Joins und versteht, wann ihr welchen benötigt.
* Ihr könnt SQL-Abfragen über mehrere Tabellen formulieren und so komplexere Analysen durchführen.

## **Key Points**

* Im relationalen Modell werden Informationen zu Objekten in separaten Tabellen gespeichert. So werden Stammdaten der Kunden z.B. in der Tabelle `customers` abgelegt, die Verkäufe in der Tabelle `sales`, und die Produkte wiederum in der Tabelle `products`. Das hat Vorteile bei der _Verwaltung_ dieser Informationen, weil wir einen Kunden so nur einmal und nicht redundant mehrfach speichern müssen. Genauso die Produkte. \

* Wollen wir jedoch Analysen durchführen, die Informationen zu allen 3 Objekten benötigen, erhöht sich durch diese Aufteilung in 3 Tabellen die Komplexität: Wir müssen die Tabellen in der Abfrage mittels SQL zuerst verknüpfen. Beispiel: Wie ist die Top 5 der Produkte nach Umsatz in jedem PLZ-Gebiet? Um diese Frage zu beantworten benötigen wir Stammdaten der Kunden (PLZ), die Verkäufe (Summe Umsatz) sowie die Produkte (Produktbezeichnung).\

* In SQL können wir den `JOIN` Operator nutzen, um zwei Tabellen miteinander zu verbinden. Wir können den `JOIN` Operator innerhalb einer Abfrage beliebig oft verwenden und so beliebige viele Tabellen in die Abfrage einbeziehen. Der JOIN Operator benötigt einen Ausdruck der angibt, wie genau 2 Tabellen miteinander verbunden werden sollen. Wir nennen diesen Ausdruck auch die `JOIN` Bedingung. Für gewöhnlich werden Tabellen über die existierenden Fremd- und Primärschlüsselbeziehungen miteinander verknüpft. Die `JOIN` Bedingung hat dann die Form `FK1 = PK`  \

* Es gibt unterschiedliche Typen von `JOINS`:\

  * `INNER JOIN`: Im Ergebnis sind nur die Zeilen enthalten, für die Treffer in beiden beteiligten Tabellen existieren. Alle anderen Zeilen werden herausgefiltert.\

  * `LEFT JOIN` und `RIGHT JOIN`: Im Ergebnis sind alle Zeilen der linken beziehungsweise der rechten Tabelle enthalten. Fehlende Pendants in der anderen Tabelle werden mit `NULL` aufgefüllt.\

  * `FULL OUTER JOIN`: Im Ergebnis sind alle Zeilen beider Tabellen enthalten, egal ob es in der jeweils anderen Tabelle Treffer gab. Fehlende Werten von auf beiden Seiten mit `NULL` aufgefüllt.\

  * `CROSS JOIN`: Das Ergebnis ist das Kreuzprodukt alle Einträge aus beiden Tabellen. Eine `JOIN` Bedingung entfällt bei diesem Typ.
