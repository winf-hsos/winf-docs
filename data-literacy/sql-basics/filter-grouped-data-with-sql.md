# Filter Grouped Data

## Gruppierte Daten filtern - so geht’s

Mit der `GROUP BY` Klausel können wir aggregierte Werte (Summen, Durchschnitte etc.) für Gruppen berechnen. Was aber, wenn wir im Ergebnis nicht alle Gruppen sehen wollen, sondern nur die, die einem gewissen Kriterium entsprechen? Hier können wir leider nicht mit der `WHERE` Klausel arbeiten, weil die sich nur auf einzelne Zeilen VOR der Gruppierung bezieht. Für gruppierte Daten gibt es die `HAVING` Klausel:

```sql
select event
      ,avg(duration / 60) as `Durchschnittliche Dauer in Minuten`
from ted_meta
group by event
having avg(duration / 60) >= 20
order by avg(duration /60) desc
```

Im Ergebnis bekommen wir nur noch Events, deren durchschnittliche Talk-Länge mindestens 20 Minuten beträgt. Als Kontrast dazu: Würden wir mit der WHERE Klausel auf der Spalte duration filtern bekämen wir nicht den gewünschten Effekt:

```sql
select event
      ,avg(duration / 60) as `Durchschnittliche Dauer in Minuten`
from ted_meta
where duration >= 20 * 60
group by event
order by avg(duration /60) desc
```

Wir würden so auf Zeilenebene alle Talks filtern, die kürzer als 20 Minuten sind und diese aus der Durchschnittsberechnung ausnehmen. Im Ergebnis können aber trotzdem Events mit einer durchschnittlichen Länge von kleiner 20 Minuten enthalten sein.

## Übungsaufgaben

#### Aufgabe 1.11

{% tabs %}
{% tab title="Aufgabe 1.11" %}
Ermittelt alle Speaker, die mindestens zwei Talks gehalten haben. Wer hat die meisten?
{% endtab %}

{% tab title="Lösung 1.11" %}
```sql
select main_speaker
      ,count(1) as `Anzahl Talks`
from ted_meta
group by main_speaker
having count(1) >= 2
order by `Anzahl Talks` desc
```
{% endtab %}
{% endtabs %}
