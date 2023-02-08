# Cheatsheet Spark SQL

## Datums- und Zeitkonvertierung

Oft bekommt aus den Quelldaten Datumsformate, die man vor der Anwendung von Datums- und Zeitfunktionen zunächst in den Spark SQL `timestamp` Datentyp konvertieren muss. Hier sind einige häufig auftretende Beispiele aufgeführt.

### Scala

```scala
// Konvertierung bzw. Cast eines Zeitstempel (vorher BigInt)
df = df.withColumn("unixReviewTime", $"unixReviewTime".cast("timestamp"))

// Konvertierung eines String-Feldes, das ein bestimmtes Datumsformat enthält
df = df.withColumn("reviewTime", unix_timestamp($"reviewTime","MM dd, yyyy")
        .cast("timestamp"))
```

### SQL

Unten die Beispiele direkt in SQL:

```sql
// Konvertierung bzw. Cast eines Zeitstempel (vorher BigInt)
select cast(unixReviewTime as timestamp) as unixReviewTime 
from reviews_Pet_Supplies

// Konvertierung eines String-Feldes, das ein bestimmtes Datumsformat enthält
select cast(unix_timestamp(reviewTime, "MM dd, yyyy") as timestamp) as reviewTime
from reviews_Pet_Supplies
```

## Konvertierung von Zahlen in wissenschaftlicher Notation

In manchen Exporten (z.B. aus Excel) können große Zahlen in wissenschaftlicher Notation ausgegeben werden. Möchte man so einen Datensatz importieren muss man diese Notation in den Datentyp long konvertieren:

### Scala

```scala
df = df.withColumn("external_author_id", $"external_author_id"
        .cast(FloatType).cast(LongType))
```

### SQL

```sql
select cast(cast(external_author_id as float) as bigint) as external_author_id
from ...
```
