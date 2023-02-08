# Anatomy of HTML

## Tags, attributes, and elements

A website is written in HTML, which is a so called markup language. A markup language differs from a programming language in an important way: You cannot write a program and run it, you can only _describe_ the elements and the structure of a document, in this case a website. A program requires commands, if-then-else structures, and loops. HTML has none of that.

In HTML, we use _tags_ to describe our website. A tag is a keyword enclosed by brackets. Most tags come in two versions: An opening tag and a closing tag. The closing tag differs from the opening tag by one symbol, the forward slash `/`:

```markup
<!-- Opening tag looks like this -->
<body>
...
<!-- Closing tag has an additional slash -->
</body>
```

We call a combination of opening and closing tag an HTML _element_.

HTML elements can have one or more attributes. Attributes add more information to an element. For example, the hyperlink element `<a>` has an attribute to define the destination of the hyperlink:

```markup
<a href="https://google.com">This link takes you to Google</a>
```

Attribute values are not visible in the browser.

## HTML template

There is a set of elements that make up the basic structure of every HTML document. The following code snippet shows the prototypical structure.

```markup
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>My first page</title>
  </head>
  <body>
    <p>A paragraph with text.</p>
  </body>
</html>
```

{% embed url="https://codepen.io/winf-hsos/pen/EdjOga" %}

As you can see, an HTML document contains two sections: The head and the body. Both serve a special purpose and contain different types of elements.

## Tree structure

You may have noticed that nesting elements in the way as we did above results in a structure that we call a _tree_. We can dran this tree (upside down), using the `<html>` element as the _root node_ of the tree. The root has two children, `<head>` and `<body>`, which in turn have children. In principle, the tree can have any number of subtrees. We call the number of subtrees the _depth_ of the tree.

![An HTML document resembles the structure of a tree.](../../.gitbook/assets/html\_tree.png)

## References

Read the following articles on MDN to get more information on elements, attributes, and the anatomy of an HTML document.

| Link                                                                                                                                                            |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Anatomy of an HTML Element (MDN)](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction\_to\_HTML/Getting\_started#Anatomy\_of\_an\_HTML\_element)  |
| [HTML Attributes (MDN)](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction\_to\_HTML/Getting\_started#Attributes)                                 |
| [Anatomy of an HTML Document (MDN)](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction\_to\_HTML/Getting\_started#Anatomy\_of\_a\_HTML\_document) |
