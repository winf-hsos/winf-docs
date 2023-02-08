# Views

Views allow us to store queries that we use often and assign a name to them:

```sql
// Only tweets from Christian Drosten as a view
create or replace temporary view tweets_drosten as
    select *
    from tweets
    where screen_name = 'c_drosten'
```

To access a view, we can now use the name of the view as though it were a table:

```sql
select * from tweets_drosten
```
