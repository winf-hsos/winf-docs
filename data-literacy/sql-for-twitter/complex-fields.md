# Complex Fields

## Array of hashtags

The `hashtags` field of a tweet contains a list of hashtags. In technical terms, a list is often called an array. To access the data in this field, there are some SQL functions we should know about. The linked section below gives an overview of the most important functions:

{% content-ref url="../sql-advanced/arrays-with-sql.md" %}
[arrays-with-sql.md](../sql-advanced/arrays-with-sql.md)
{% endcontent-ref %}

## Array of URLs

Find an example notebook for working with the `urls` field in twitter data under the link below:

{% embed url="https://winf-hsos.github.io/databricks-notebooks/big-data-analytics/ss-2020/Working%20with%20URLs.html" %}

Die URLs und Fotos sind in den Feldern `urls` und `photos` gespeichert. Beide Spalten sind vom Typ Array, was bedeutet, dass ein Tweet mehrere URLs bzw. mehrere Fotos haben kann. Der generelle Umgang mit Array wird im Tutorial [JSON-Felder mit SQL verarbeiten](../sql-advanced/json-and-sql.md#arrays-abfragen) erklärt. Hier eine Abfrage, die jeweils die erste URL / Foto eines Tweets in einer eigenen Spalte anzeigt:

```sql
select urls[0].clean_url as `First URL in Tweet`
from tweets
where size(urls) > 0
or size(photos) > 0
```

## Create a view for profile images

```sql
create or replace view twitter_profile_images as
select screen_name, profile_image from 
(
  select screen_name
        -- Entfernen des _normal Zusatzes, um größeres Bild zu bekommen
        ,regexp_replace(profile_image_url_https, '_normal', '') as profile_image
        ,rank() over (partition by screen_name order by retrieved_time desc) as `rank`
  from users
  where screen_name in (select distinct follower_of from twitter_followers)
) 
-- Jeweils nur den aktuellsten Datensatz pro Account
where rank = 1
```

## Extrahieren der Koordinaten eines Tweets

Das Feld coordinates liefert uns die Koordinaten eines Tweets als Längen- und Breitengrad. Die Angabe bezieht sich dabei auf den Ort, von dem aus der Tweet abgeschickt wurde. Dieses Feld ist nur befüllt, wenn die verwendete Applikation diese Information bereitgestellt hat und der User die Freigabe der Koordinaten erteilt hat.

Folgendes SQL Statement ermittelt für einen Tweet die Angaben, die anschließend z.B. in Tableau visualisiert werden können:

```sql
select text
      ,user_location
      ,coordinates.coordinates[0] as `longitude` 
      ,coordinates.coordinates[1] as `latitude` 
from tweets
where coordinates is not null
```
