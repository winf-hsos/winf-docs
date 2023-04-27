---
description: >-
  An important concept in programming is not to write the same piece of code
  twice. What does that mean and what to do instead?
---

# 17 - Don't Repeat Yourself

{% hint style="warning" %}
Welcome interesed student of the LiFi-project. I am glad you want to jump ahead, but I am still building this course as we move through the semester, and this part is not ready yet. Please come back later.
{% endhint %}

{% hint style="info" %}
This section is relevant for [Exercise 6: Back to SMS](https://github.com/winf-hsos/lifi-exercises/raw/main/exercises/06\_exercise\_back\_to\_sms.pdf).
{% endhint %}

## Don't Repeat Yourself!

An important principle in programming is "Don't Repeat Yourself". Code that we need in several places of our program should be given a name and wrapped in a function. We saw how to do this [earlier in this section](processing-text.md#5.-functions). We can simply call functions like any other command from anywhere in our program.&#x20;

### Modules

If we put all our custom created, useful functions into a file and call it, for example, `useful_funcs.py` ,we have created a so-called <mark style="background-color:green;">**module**</mark>.

<img src="../.gitbook/assets/file.excalidraw (2) (2).svg" alt="A module is a collection of useful functions in a Python-file." class="gitbook-drawing">

The great benefit of modules is that we can reuse and import them in different programs. These can be our programs or the program's from someone else. The latter requires that person to have a copy of our module:

<img src="../.gitbook/assets/file.excalidraw (3) (2) (1).svg" alt="A module can be imported by another program." class="gitbook-drawing">

### Libraries

If you program for a longer time, you might at some point have written so many functions that it makes sense you create separate modules for them. You now have a set of Python-files, each containing functions that address a common problem or belong together in some other way. If in turn those modules somehow belong together because they too address a common, but larger issue, you can bundle those modules into a so-called <mark style="background-color:green;">**library**</mark>. Look at the example below, where the three modules `geometry.py`, `algebra.py`, and `arithemtic.py` each contain functions to solve specific problems from a particular domain. However, the modules share that they all solve mathematical problems. It therefore makes sense to group them into a library called `Math`.

<img src="../.gitbook/assets/file.excalidraw (1) (2).svg" alt="A library is a collection of related modules." class="gitbook-drawing">

So, here is the difference between a module and a library: a module is a _collection of functions_ that live in one Python-file. A library is a _collection of related modules_ bundled together. So in that sense, a library is bigger than a module.

### GitHub and PyPI

When we're happy with our library, we can share it with the world. There are different options for that, but the online-platform <mark style="background-color:green;">**GitHub**</mark> is a great place to start. On GitHub, we can publish code and others can get inspired or re-use that code in their projects. The code examples for this course live on GitHub, too:

{% embed url="https://github.com/winf-hsos/LiFi-code" %}

Another way for everyone to use your library is to have it listed in the [Python Package Index (PyPI)](https://pypi.org/), which allows to download and install your library with one line on the command line:

```
pip install my_library
```

After this command ran successfully, one can import functions from the library in their programs like this:

```python
from my_library import calc_C
```

From now on, the function `calc_C` can be used in that program like any other function.

It is important to note that a library can contain not just functions, but is often used to declare constant values, too. This is, in fact, a use case in our LiFi-project.
