# Explore Data with SQL

## Lernziele

In diesem Tutorial bekommt ihr einen Überblick, mit welchen SQL-Abfragen ihr euch schnell einen Überblick über einen unbekannten Datensatz verschaffen könnt. Es geht hier um eine gezielte Bündelung der Abfragen, die bei dem **Erkunden von neuen Daten** relevant sind.

## Datensätze zählen

Meistens interessiert im ersten Schritt der Umfang des Datensatzes, also die Anzahl der Zeilen. Das bekommen wir ganz einfach heraus:

```sql
select count(*) from ted_meta
```

## Überblick über den Wertebereich einer Spalte bekommen

Der erste Hinweis auf den Wertebereich gibt euch bereits der `describe` Befehl. Er liefert neben dem Namen auch den Datentyp einer Spalte zurück. Um aber ein besseres Bild zu bekommen, welche Werte in einer Spalte enthalten sind, kann man sich z.B. alle eindeutigen Werte sortiert ausgeben lassen:

```sql
select distinct event from ted_meta
```

Eine Alternative mit der zusätzlichen Information über die Häufigkeitsverteilung der einzelnen Werte bietet  eine Gruppierung kombiniert mit `count(1)`:

```sql
select event, count(1) as `Number Occurences`
from ted_meta
group by event
order by `Number Occurences` desc
```

Die häufigsten Werte werden im Ergebnis oben angezeigt.

### Schnelle Visualisierungen

Databricks bietet die Möglichkeit, tabellarische Ergebnisse mit einem Mausklick in eine visuelle Form zu bringen. Dazu nutzt ihr die Buttonleiste unter der Ergebnisanzeige. Mit Klick auf Chartsymbol bekommt ihr sofort eine Anzeige als Balkendiagramm. Über die den Button "Plot Options..." könnt ihr auch andere Charts auswählen und die Achsen konfigurieren.

![Die Anzahl Talks pro Event als Area-Chart.](<../../../.gitbook/assets/image (34).png>)

## Die zeitliche Verteilung der Daten ermitteln

Die meisten Datensätze, die wir in der Praxis analysieren, haben einen Zeitbezug. Konkret heißt das, es gibt mindestens eine Spalte mit dem Datentyp `timestamp` oder `date`.

### Verteilung pro Jahr oder Monat

Über diese Spalten bekommen wir die Information, auf welchen Zeitraum sich die vorliegenden Daten beziehen. Wie aktuell sind die Daten? Wie weit reicht die Historie der Verkaufszahlen zurück? Aus welchen Jahren stammen die TED Talks? Die letzte Frage können wir so beantworten:

```sql
select year(film_date) as `Jahr des Talks`
      ,count(1) as `Anzahl Talks`
from ted_meta
group by year(film_date)
order by year(film_date)
```

Auch hier ist eine Visualisierung sinnvoll:

{% hint style="info" %}
Neben dem Jahr oder Monat könnt ihr auch andere Datumsbestandteile extrahieren. Schaut dazu in den Teil [#8 Datum und Zeit](../sql-advanced/date-and-time-with-sql.md) des einführenden SQL Tutorials.
{% endhint %}

![](<../../../.gitbook/assets/image (17).png>)

### Anfangs- und Enddatum

In manchen Fällen interessiert uns auch das konkrete Datum, das am weitesten in der Vergangenheit liegt, oder das am aktuellsten ist:

```sql
select max(film_date) as `Aktuellstes Datum`
      ,min(film_date) as `Ältestes Datum`
from ted_meta
```

## Statistische Größen berechnen

Das arithmetische Mittel (Durchschnitt) lässt sich in SQL sehr einfach berechnen:

```sql
select avg(duration) from ted_meta

// Alternative
select mean(duration) from ted_meta
```

Auch der Median lässt sich mit SQL berechnen:

```sql
select percentile(duration, 0.5) as `Median`
from ted_meta
```

Die Standardabweichung:

```sql
select stddev(duration) as `Standardabweichung`
from ted_meta
```

Und auch komplexere Kennzahlen, wie der Korrelationskoeffizient nach Pearson lassen sich mit SQL ermitteln:

```sql
select corr(views, comments) as `Pearson`
from ted_meta
```
