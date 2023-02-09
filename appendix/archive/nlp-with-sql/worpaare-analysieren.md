# Word Pairs

Es kann sinnvoll sein, nicht nur einzelne Wörter zu betrachten, sondern auch 2er-Kombinationen von Wörtern zu analysieren. Z.B. um herauszufinden, mit welchen anderen Wörtern das Wort "not" zusammen vorkommt, um eine spezifischere Sentiment-Analyse zu ermöglichen. Das SQL unten erstellt einen View, der für Tweets Wortpaare bildet, die im Tweet direkt aufeinander folgen:

```sql
create or replace view tweet_word_pairs as
  select t1.id as id
        ,t1.word as left_word
        ,t1.pos as left_pos
        ,t2.word as right_word
        ,t2.pos as right_pos
        ,t1.original_text 
  from tweets_prep_step_4 t1
  inner join tweets_prep_step_4 t2
    on t1.pos = t2.pos - 1
    and t1.id = t2.id
  order by id, left_pos
```

Das Ergebnis des Views sieht so aus:

```sql
select * from tweet_word_pairs
```

![](<../../../.gitbook/assets/image (38).png>)

Um nun z.B. herauszufinden, welche Wörter häufig auf das Wort "not" folgen, kann folgendes SQL verwendet werden:

```sql
select left_word
      ,right_word
      ,count(1) as `num_occurences`
from tweet_word_pairs
where left_word = 'not'
group by left_word, right_word
order by `num_occurences` desc
```
