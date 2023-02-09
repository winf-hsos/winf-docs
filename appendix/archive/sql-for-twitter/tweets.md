---
description: >-
  Let's see what kind of information a tweet is made of and how we can access it
  using SQL.
---

# Explore Tweets

## Databricks Notebook

For the following queries, you can import the template linked below. It contains all the queries in this section:

:link: [Databricks Notebook: Explore Tweets](https://winf-hsos.github.io/databricks-notebooks/big-data-analytics/ss-2020/Explore%20Tweets.html)

## What columns does a tweet have?

![](<../../../.gitbook/assets/tweet\_erm (2).png>)

We can quickly get an overview of all available columns using the following SQL statement:

```sql
describe tweets
```

The result is a table with the name and data type of each column:

| Column Name                 | Data Type        |
| --------------------------- | ---------------- |
| id                          | String           |
| screen\_name                | String           |
| created\_at                 | Timestamp        |
| lang                        | String           |
| text                        | String           |
| hashtags                    | Array of Strings |
| is\_retweet                 | Boolean          |
| is\_quote\_status           | Boolean          |
| in\_reply\_to\_screen\_name | String           |
| in\_reply\_to\_status\_id   | String           |
| favorite\_count             | Integer          |
| quote\_count                | Integer          |
| retweet\_count              | Integer          |
| retweeted\_status\_id       | String           |
| retweeted\_user             | String           |
| urls                        | Array of Structs |
| photos                      | Array of Structs |
| user\_mentions              | Array of Strings |
| source                      | String           |
| insert\_timestamp           | Timestamp        |

You will also find an official documentation on all fields of a tweet on the Twitter developer website:

{% embed url="https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/tweet-object.html" %}

## How many tweets are there?

If we want to know how many tweets we have in our data set, we can do a simple count of all rows:

```sql
select count(*) from tweets
```

## How many tweets are there by user?

The same question, but now we want to know the number per user. For that, we apply grouping tweets by `screen_name`. In addition, we sort the result by the number of tweets in descending order (`desc`) so that the user with the most tweets shows on top:

```sql
select count(*) as `Number Tweets`
      ,screen_name as `User`
from tweets
group by screen_name
order by count(*) desc
```

## How many tweets are there over time?

To see if there any abnormalities or trends in our data, lets aggregate the number of tweets by time period. In the example below, we use months, and we add an extra field `Period` that contains the year and month value concatenated by a hyphen. This field proofs useful for visualization and sorting:&#x20;

```sql
select month(created_at) as `Month`
      ,year(created_at) as `Year`
      ,year(created_at) || '-' || month(created_at) as `Period`
      ,count(1)
from tweets
where year(created_at) IN (2019, 2020)
group by month(created_at), year(created_at)
order by year(created_at), month(created_at)
```

## How many tweets are there per hour of the day?

It might be interesting to get a feeling for when the users tweet during the day. Let's create a query that groups by the hour of the day and visualize the result:

```sql
select hour(created_at) as `Hour`
      ,count(*) as `Number Tweets`
from tweets
group by hour(created_at)
order by hour(created_at) asc
```

The result visualized in Databricks as a bar chart:

![Number of tweets in every hour of the day in the example data set.](<../../../.gitbook/assets/image (27).png>)

## What is the top 10 of the most popular tweets?

When we assume that the number of times a tweet got liked (or _favorited_ in twitter terms) indicate its popularity, the following query gives us the top 10 in our data set:

```sql
select screen_name
      ,text
      , favorite_count
from tweets
order by favorite_count desc
limit 10
```

Instead of `favorite_count`, we could do the same query using `retweet_count`, which contains the number of times a tweet was re-tweeted:

```sql
select screen_name
      ,text
      ,retweet_count
from tweets
where is_retweet = false
order by retweet_count desc
limit 10
```

But be careful: We filter out tweets that are already retweets using the condition `is_retweet = false`. We do this for good reason, because otherwise we would have a top ten full of tweets that are not originally from our data set's user base.

## How many hashtags does a tweet have on average?

We can put a label on a tweet so that people can easily find tweets regarding specific topics. Theses labels are called hashtags, and in our data set they are stored in the field `hashtags`.&#x20;

When we look closer at this field, we see that the data type is somewhat different than from the other fields we have explored so far. Twitter stores hashtags in a data structure called an _array_, which is simply list of values. These single values are of the type string, so we say that the hashtags are stored in an _array of strings_.

### Counting elements in an array

But how do we access an array and its elements? We'll learn this later, but for now let's look at how we can count the elements in an array:

```sql
select size(hashtags) as `Number Hashtags`
      ,hashtags
from tweets
order by size(hashtags) desc
```

We can apply the function `size()` to an array, and it returns the number of elements in that list. The query above sorts the result by the number of hashtags a tweet has, which means we'll see the tweet with the most hashtags on top.

### Calculating the average

Now that we can count elements in an array, calculating the average across all tweets is a breeze:

```sql
select avg(size(hashtags))
from tweets
```

## How many tweets contain a specific hashtag?

### Check whether a list contains an element

Usually, we are interested in the specific hashtags a tweet has, not just the sheer number. So how can we check whether a tweet contains a certain hashtag? In technical terms: How can we check if an array contains a certain element? The function `array_contains()` can help us:

```sql
select text
      ,hashtags
from tweets
where array_contains(hashtags, 'covid19')
```

The query above fetches all tweets with the hashtag **#covid19** from our data set. To count them, we can use this query:

```sql
select count(*) as `Number Tweets`
from tweets
where array_contains(hashtags, 'covid19')
```

## How long is the average tweet?

Staying at count things - let's count the number of character in our tweets and from there calculate the average length of a tweet.&#x20;

### Determine the length of a string

We can get the length of text (string) with the `length()` function:

```sql
select length(text)
      ,text
from tweets
order by length(text) desc
```

As before, calculating the average is straightforward:

```sql
select avg(length(text))
from tweets
```

## Who is most often retweeted by users in our data set?

To identify relevant accounts, it can be useful to find those who are retweeted very often. As we have seen above, we can check if a tweet is actually a retweet by looking at the field `is_retweet`. If we now select the field `retweeted_user`, group by this field, and count the number of occurrences for each user, we are close to what we want. Finally, let's sort the result by the number of occurrences in descending order:

```sql
select retweeted_user
      ,count(*) as `Number Retweeted`
from tweets
where is_retweet = true
group by retweeted_user
order by count(*) desc
```

What does the result tell us exactly? The row on top of our result is the screen name (or user) that was most often retweeted by users in our data set. But be cautious: This doesn't mean that the user with the most retweets is actually part of our data set - it is even rather unlikely.&#x20;

If we want to limit the result to users who are also part of our data set, we can tweak the query a little bit:

```sql
select retweeted_user
      ,count(*) as `Number Retweeted`
from tweets
where is_retweet = true
and retweeted_user in (select distinct screen_name from tweets)
group by retweeted_user
order by count(*) desc
```

We added line 5 to our statement. Here, we narrow down the result to users in our data set using a subquery. This subquery is a query on its own, and it returns the list of distinct users in our data set. (You can copy and run the subquery in a separate code block to convince yourself). We then require that the field `retweeted_user` must be part of that list.
