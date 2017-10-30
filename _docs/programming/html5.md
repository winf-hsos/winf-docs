---
title: HTML5
layout: doc
---

<!--
* TOC
{:toc}
-->

# Basic HTML layout

```html
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta data and linking to resources go here -->
    </head>
    
    <body>
        <!-- Your site's content goes here -->
    </body>

</html>
```


# The HEAD tag

Think of the `<head>` tag like the head of a letter. It contains meta information, but not the content itself. In HTML, meta information can be many things, such as:

- The title of the website
- The language of the website 
- Important keywords, e.g. for search engine indexing
- A summary to display in search results
- Information about the styling of the website


```html
    <head>
        <title>The title of your website</title>
        <link rel="css"></link>
        
        <style>
            /* Styling goes here */
        </style>
        
    </head>
```

# The BODY tag

```html
    <body>
        <p>This is a paragraph</p>
        
        <ul>
            <li>This is an unordered list item</li>
            <li>Another one</li>
        </ul>
        
        <img scr="images/myprofile.jpg" alt="This is an image"/>
    </body>
```
