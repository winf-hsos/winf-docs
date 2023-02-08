# Process Text Data

## Wörter mit 2 Buchstaben entfernen

Das folgende SQL-Statement entfernt alle Wörter mit genau 2 Buchstaben aus einem Text und ersetzt es mit einem leeren String (entfernt es aus dem Text).

```sql
select text, 
      regexp_replace(text, "(?<=\ )(.{2}?)(?=\ )", "") as text_replaced
from ted_text
```
