# Deductive Topic Analysis

## Codebuch anlegen und erstes Thema einpflegen

Bei der **deduktiven Variante** der Themenidentifikation ist die Ausgangsbasis eure eigene Überlegung, welche Themen in den Daten eine Rolle spielen könnten. Im Vergleich dazu kommen die Themen bei der induktiven Variante ausschließlich aus den Daten selbst.

Um einen Startpunkt zu bekommen erstellt ihr im ersten Schritt ein neues Google Sheet mit 2 Spalten: Die erste beinhaltet das Keyword, und die zweite ordnet das Keyword einem Thema zu. Achtet darauf, dass das Keyword in Kleinbuchstaben geschrieben wird, weil wir auch die Wörter der zerlegten Texte allesamt klein geschrieben haben. Das erleichtert uns den Vergleich mit SQL, weil wir uns nicht um Groß- und Kleinschreibung kümmern müssen.

![So könnte eine Codebuch in Google Sheets initial aussehen.](<../../../.gitbook/assets/image (54).png>)

## Codebuch veröffentlichen und in Databricks laden

Nachdem ihr euer Codebuch angelegt habt müsst ihr es zuerst im Web veröffentlichen, damit ihr die Tabelle in Databricks laden könnt. Eine Beschreibung wie beides genau funktioniert findet ihr im [vorigen Abschnitt](mapping-tables-with-sql.md).

## Codebuch auf die Daten anwenden

Wir nehmen im Folgenden an, dass ihr das Codebuch als Tabelle mit dem Namen `codebook` in Databricks verfügbar habt. Gleichzeitig liegt uns der in Wörter zerlegte Text als View mit dem Namen `tweets_prep_step_4` vor. Beide Tabellen verbinden wir jetzt über einen **LEFT JOIN**, um das Codebuch anzuwenden:

```sql
select id
      ,user
      ,original_text
      ,word
      ,keyword    
      ,topic
from tweets_stop t
left join codebook c
  on t.word = c.keyword
where c.keyword is not null
order by id, topic
```

Die letzte Zeile sorgt dafür, dass im Ergebnis nur Tweets mit einem Keyword aus unserem Codebuch enthalten sind. Je nachdem welche Daten in eurem Account geladen sind kann das Ergebnis so oder so ähnlich aussehen:

![](<../../../.gitbook/assets/image (18).png>)

In der letzten Spalte `topic` steht das zugeordnete Thema, in den beiden Spalten davor das Schlüsselwort, dessen Vorhandensein zu der Zuordnung des Themas geführt hat.

Auffällig ist, dass bei obigen SQL Statement:

1. Für jedes getroffene Keyword eine Zeile im Ergebnis vorhanden ist (mit dem gleichen Thema).
2. Für jedes Thema eine eigene Zeile im Ergebnis vorhanden ist (kann so erwünscht sein).

Den ersten Punkt wollen wir gerne anders lösen: Statt einer Zeile für jedes Keyword des gleichen Themas soll die Trefferzahl aggregiert werden und gleichzeitig die gefundenen Keywords als Spalte vom Typ Array ausgegeben werden:

```sql
select id
      ,user
      ,original_text
      ,collect_list(keyword) as `hits`
      ,topic
      ,count(1) as `number_hits`
from tweets_prep_step_4 t
left join codebook c
  on t.word = c.keyword
where c.keyword is not null
group by id, user, original_text, topic
order by number_hits desc
```

Die Funktion `collect_list` in Zeile 4 aggregiert die gefundenen Keywords, die zuvor in einer oder mehreren Zeilen standen, in ein Array. Das `count(1)` in Zeile 6 zählt die Zeilen, also die gefundenen Keywords. Durch das Gruppieren der restlichen Spalten erhalten wir im Ergebnis jeden Tweet und identifiziertes Thema jetzt genau einmal. Durch die neue Sortierung nach der Anzahl gefundener Keywords stehen nun die Themen mit den meisten Treffern oben.

![](<../../../.gitbook/assets/image (31).png>)
