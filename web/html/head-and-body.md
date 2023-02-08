# Head and Body

## The head

The head contains metadata about the website. Nothing that is placed in the head is visible on the website. Among other elements, the `<head>` tag contains the `<title>` tag and at least one `<meta>` tag.

### The \<title> tag

The value of the `<title>` tag defines the title of the website, which is displayed in the browser window bar (or tab).

### The \<meta> tag

Usually, a `<meta>` tag has two attributes:

1. `name` : Attribute to describe the type of metadata
2. `content` : Attribute the define the value of that metadata

The listing provides examples for common metadata tags:

```markup
<head>
    <meta name="author" content="Elon Musk">
    <meta name="description" content="Simple website for illustration">
    <meta name="keywords" content="rockets,tesla,universe">
    <meta charset="utf-8">   
</head>
```

The metadata serves several purposes. For example, search engines like Google can use it to better understand the website's content and thereby improve the search results. Moreover, some metatags like the ones defined by the [Open Graph Protocol](http://ogp.me/) allow for an illustrative link preview when shared on Facebook or Slack.

Read more about the head and its elements at the following links:

{% embed url="https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/The_head_metadata_in_HTML" %}

{% embed url="https://developer.mozilla.org/en-US/docs/Web/HTML/Element/title" %}

{% embed url="https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta" %}

## The body

The body is where the visible part of your website lives. The following sections cover tags and their attributes that allow you to describe the structure and the visible elements of your website.

