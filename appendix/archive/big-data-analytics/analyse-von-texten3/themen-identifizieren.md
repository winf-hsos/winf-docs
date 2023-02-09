---
description: Wie identifizieren wir mittels SQL Themen in Texten?
---

# Themen identifizieren

## :dart: Lernziele

* :dart: Ihr kennt Vorgehen, um iterativ Themen in Texten zu identifizieren.
* :dart: Ihr extrahiert Themen für eure Fragestellungen mithilfe von SQL.

## :arrow\_forward: Lerneinheit

### :one: Deduktive Themenidentifikation mit Suchbegriffen

Eine Möglichkeit, Themen in Texten zu identifizieren, besteht darin, sich vorab theoriegeleitet Gedanken zu möglichen Themen zu machen und dann nach diesen anhand von Suchbegriffen in den Texten zu suchen.

Die Anwendung der deduktiven Methode mit SQL wird hier beschrieben:

{% content-ref url="../../nlp-with-sql/identify-topics-in-text/2-deduktive-themenanalyse.md" %}
[2-deduktive-themenanalyse.md](../../nlp-with-sql/identify-topics-in-text/2-deduktive-themenanalyse.md)
{% endcontent-ref %}

### :two: Induktive Themenidentifikation mit Suchbegriffen

Beim induktiven Vorgehen leiten wir die Themen aus dem Material ab. Wir treffen somit keine Annahmen, welche Themen existieren könnten und suchen dann gezielt danach, sondern wir suchen in den Texten nach Hinweisen auf unbekannte Themen, stellen eine Hypothese auf, und überprüfen diese.

Die Anwendung der induktiven Methode mit SQL wird hier beschrieben:

{% content-ref url="../../nlp-with-sql/identify-topics-in-text/3-induktive-themenanalyse.md" %}
[3-induktive-themenanalyse.md](../../nlp-with-sql/identify-topics-in-text/3-induktive-themenanalyse.md)
{% endcontent-ref %}

### :page\_with\_curl: Databricks Notebook Template

Für die deduktive Themenidentifikation gibt es das folgende Template mit den wichtigsten SQL-Befehlen.

* [Themen identifzieren](https://winf-hsos.github.io/databricks-notebooks/big-data-analytics/Themen%20identifizieren.html)



