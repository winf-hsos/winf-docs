# Tokenize

## Aus einem Text werden mehrere Zeilen

Der View aus dem [Schritt 2](2-texte-bereinigen-und-normalisieren.md) gibt uns eine bereinigte und normalisierte Form des Ursprungs-Tweets. Aus:

```
RT @pugandcat: Whisker licking good food from @lilyskitchen
```

wird:

```
rt pugandcat whisker licking good food from lilyskitchen
```

Nun wird es Zeit, aus dem zusammenhängenden Text einzelne Wörter zu machen. Dabei hilft uns die Funktion `split()`:

```sql
create or replace view tweets_words as
  select user
        ,created_at
        ,split(text, ' ') as `words`
  from tweets_cleaned
```

Das `split(text, ' ')` in Zeile 4 hat zur Folge, dass wir in der neuen Spalte `words` dieses Ergebnis sehen:

```
["rt","pugandcat","whisker","licking","good","food","from","lilyskitchen"]
```

Komme euch das bekannt vor? Richtig, es handelt sich um ein Array, was wir an den eckigen Klammern außen erkennen können. Array können wir mit `explode()` in seine Einzelteile zerlegen, so dass wir jedes Element in einer eigenen Zeile vorliegen haben:

```sql
-- Array von Wörtern in Zeilen zerlegen
select explode(words) as `word` from tweets_words
```

Wenn wir nun beide Funktionen verschachtelt anwenden haben wir unseren finalen View für Schritt 3:

```sql
create or replace view tweets_words as
select id
      ,screen_name
      ,created_at
      ,lang
      ,posexplode(split(text, ' ')) as (position, word)
from tweets_cleaned
```
