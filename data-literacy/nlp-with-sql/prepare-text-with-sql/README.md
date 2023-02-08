# Prepare Text

## Lernziele

Um Texte mit SQL sinnvoll analysieren zu können, müssen wir sie zunächst in eine andere Form bringen. Konkret müssen wir eine **Struktur** auf die vorher unstrukturierten Textdaten projizieren. Wir lernen in diesem Tutorial, wie wir auf Texte eine einfache Struktur projizieren können, indem wir sie in einzelne Wörter (Token) zerlegen.

## Daten für das Tutorial

Für dieses Tutorial verwenden wir Twitter-Daten als Beispiel, wie sie im Modul Big Data Analytics erhoben werden.

{% hint style="info" %}
Ich stelle bald ein Template mit einem ausgewählten Twitter-Datensatz bereit, so dass jeder dieses Tutorial nutzen kann.
{% endhint %}

## In 5 Schritten ans Ziel

Texte sind unstrukturierte Daten in dem Sinn, dass es keine Struktur wie Spalten mit atomaren Werten und Datentypen gibt, auf denen wir z.B. mittels der `WHERE` Bedingung Filter definieren oder die wie in einer sinnvollen Form aggregieren können. Daher müssen wir zunächst eine Struktur auf die Texte projizieren, auf der wir anschließend mit SQL Analysen durchführen können. Eine Möglichkeit ist das Zerlegen der Texte in einzelne Wörter (Token).

Im Prozess, die Texte in einzelne Wörter zu zerlegen, werden wir 5 unterschiedliche Schritte nacheinander durchführen:

{% content-ref url="1-zeilen-filtern.md" %}
[1-zeilen-filtern.md](1-zeilen-filtern.md)
{% endcontent-ref %}

{% content-ref url="2-texte-bereinigen-und-normalisieren.md" %}
[2-texte-bereinigen-und-normalisieren.md](2-texte-bereinigen-und-normalisieren.md)
{% endcontent-ref %}

{% content-ref url="3-texte-in-woerter-zerlegen.md" %}
[3-texte-in-woerter-zerlegen.md](3-texte-in-woerter-zerlegen.md)
{% endcontent-ref %}

{% content-ref url="4-stopwoerter-filtern.md" %}
[4-stopwoerter-filtern.md](4-stopwoerter-filtern.md)
{% endcontent-ref %}

{% content-ref url="5-pos-tagging.md" %}
[5-pos-tagging.md](5-pos-tagging.md)
{% endcontent-ref %}

Die Zusammenfassung der 5 Schritte gibt es auch als Foliensatz:

{% embed url="https://docs.google.com/presentation/d/1ucTdKscyjA7QNfnbkXQZTDqtnTUkpntGbTWjeZVsv0A/edit?usp=sharing" %}

###
