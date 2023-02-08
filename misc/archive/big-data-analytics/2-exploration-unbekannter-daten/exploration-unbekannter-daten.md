---
description: In dieser Lerneinheit geht es die Erkundung eines neuen Datensatzes mit SQL.
---

# Exploration unbekannter Daten

## :question: Fragen

* Welche Spalten hat der neue Datensatz und welchen Datentyp haben die Spalten?
* Wie viele Zeilen sind in den Datensätzen jeweils enthalten?
* Wie ist die Verteilung der Werte in den einzelnen Spalten des Datensatzes?
* Wie ist es um die Datenqualität beschaffen?
* Wie ist der zeitliche Bezug der Daten?

## :label: Begriffe

* :label: Datentypen
* :label: JSON
* :label:Domain (Wertebereich)

## :arrow\_forward: Lerneinheit

### :one: Exploration neuer Daten mittels SQL

Führt das folgende Tutorial durch, um wichtige Funktionen für die Erkundung eines neuen Datensatzes kennenzulernen. Wendet die Abfragen auf die Datensätze der Fallstudie an. Nutzt dazu die bereitgestellten [Databricks Notebook Templates im Anhang dieser Veranstaltung](../anhang/#notebook-templates), um die Daten in euren Account zu laden. Beginnt anschließend mit der Erkundung der Daten.

{% content-ref url="../../../../data-literacy/sql-basics/daten-mit-sql-erkunden.md" %}
[daten-mit-sql-erkunden.md](../../../../data-literacy/sql-basics/daten-mit-sql-erkunden.md)
{% endcontent-ref %}

### :two: Spalten mit einer Baumstruktur (JSON-Objekte)

Je nach Datensatz werdet ihr feststellen, dass manche Spalten eine spezielle Struktur aufweisen. Es sind darin keine atomaren Werte wie Zahlen oder Datumswerte gespeichert, sondern ganze Objekte mit einer eigenen Struktur. Diesen Spaltentyp nennen wir ein :label:JSON-Objekt. In den folgenden beiden Tutorials lernt ihr, was es damit auf sich hat und wie wir diese Spalten mittels SQL abfragen können.&#x20;

Wendet die Konzepte auf die entsprechenden Spalten eurer Datensätze an.

{% content-ref url="../../../../coding-with-javascript/einfuehrung-in-json.md" %}
[einfuehrung-in-json.md](../../../../coding-with-javascript/einfuehrung-in-json.md)
{% endcontent-ref %}

## :link: Links

Unter dem folgenden Link findet ihr eine Zusammenfassung der wichtigsten SQL-Funktionen auf 2 Seiten:

{% content-ref url="../../../../data-literacy/sql-advanced/cheatsheet-sql.md" %}
[cheatsheet-sql.md](../../../../data-literacy/sql-advanced/cheatsheet-sql.md)
{% endcontent-ref %}
