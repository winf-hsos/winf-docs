# Clean & Process Data

{% hint style="info" %}
This page is a placeholder until I finish the article of the script.
{% endhint %}

## Remove duplicate records

Due to errors or even built-in safety mechanisms in the Twitter API, as well as potential errors in the [Twitter Collector Tool](https://big-data-analytics-helper.web.app/), it can happen that we have duplicate tweets in our database. Before we analyze the data, it is a good idea to remove them.

Learn how to check for duplicates and remove them in this article:

{% content-ref url="../sql-for-twitter/clean-twitter-data.md" %}
[clean-twitter-data.md](../sql-for-twitter/clean-twitter-data.md)
{% endcontent-ref %}

## Filter data beforehand

Depending on your question, filtering the data can be part of the preparation process. Filtering can be useful on different attributes.

### By user

By user, of you are only interested in the tweets by one user or a group of users. You can then easily filter tweets using the `screen_name` attribute.

{% content-ref url="../sql-basics/filter-rows-with-sql.md" %}
[filter-rows-with-sql.md](../sql-basics/filter-rows-with-sql.md)
{% endcontent-ref %}

### By date

By date, if you want to analyze what was going on on Twitter in the recent year, month, etc. Use the `created_at attribute` for that.

{% content-ref url="../sql-advanced/date-and-time-with-sql.md" %}
[date-and-time-with-sql.md](../sql-advanced/date-and-time-with-sql.md)
{% endcontent-ref %}

### By topic or hashtag

It can be useful to filter tweets by their content:

* Only tweets that contain a set of hashtags
* Only tweets that contain certain words
* Only tweets that talk about a specific topic

To work with **hashtags**, you need to understand how to access an array with SQL. The following tutorial will help you:

{% content-ref url="../sql-for-twitter/complex-fields.md" %}
[complex-fields.md](../sql-for-twitter/complex-fields.md)
{% endcontent-ref %}

If you want to search in texts for the occurrences of words, there are numerous ways to achieve that:

{% content-ref url="../nlp-with-sql/in-texten-nach-woertern-suchen.md" %}
[in-texten-nach-woertern-suchen.md](../nlp-with-sql/in-texten-nach-woertern-suchen.md)
{% endcontent-ref %}

Identifying topics in text is a bit more advanced. There are different techniques available:

{% content-ref url="../nlp-with-sql/identify-topics-in-text/" %}
[identify-topics-in-text](../nlp-with-sql/identify-topics-in-text/)
{% endcontent-ref %}

## Use views to access processed data

In any case, you should make sure you store the result of the de-duplication or filtering process on a temporary view or even a permanent table. This way, you can always access the filtered data for analysis and the queries are likely to run faster with less data to process.

{% content-ref url="../sql-advanced/views.md" %}
[views.md](../sql-advanced/views.md)
{% endcontent-ref %}
