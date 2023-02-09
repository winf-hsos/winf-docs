# Clean Twitter Data

## Filter duplicate tweets

Durch die Twitter API kann es vorkommen, dass einige Tweets doppelt in den Daten vorhanden sind. Das können wir in SQL beheben:

```sql
-- Auf doppelte Tweets prüfen
select id
      ,count(1) 
from tweets
group by id 
order by count(1) desc
```

Wir sehen im Ergebnis, dass manche IDs zwei Mal vorkommen. Wir können mit der Window-Funktion `row_number()` innerhalb der gleichen ID jeder Zeile eine Nummer geben. Somit hat keine der beiden ansonsten gleichen Zeilen die gleiche `row_num`.

```sql
-- Zeilenummern generieren innerhalb einer ID-Gruppe
select id
      ,count(1) over(partition by id) as `occ`
      ,row_number() over(partition by id order by id) as `row_num`
from tweets
order by `occ` desc, id
```

Wenn wir jetzt das Ergebnis von oben als Unterabfrage verwenden und auf `row_num = 1` filtern, fallen alle doppelten Zeilen im Ergebnis raus:

```sql
-- Immer nur die erste Zeile selektieren
select * from (
    select * ,row_number() over(partition by id order by id) as `row_num`
    from tweets
)
where row_num = 1
```
