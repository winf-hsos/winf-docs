---
description: >-
  In this lesson, we introduce the notion of a program as a set of instructions.
  But what exactly is an instruction? And what different kinds exist?
---

# 5 - Program's Anatomy

<details>

<summary>Summary</summary>

In this section, you'll learn:

* That a program is a set of instructions.
* What the five types of instructions are that make up every program.
* What an expression is and what types exist.

This section concerns the question of how we can solve problems with digital computers adds to your understanding of programming.&#x20;

</details>

## Instructions

A program is a set of instructions that are executed by a computer. A program is written as plain text, and we usually use a separate line for a new instruction. To write a program, all we need is a simple text editor, although in the LiFi-project, we prefer a [complete development environment](development-environment.md).&#x20;

When a computer executes a program, it steps through the program one line at a time and does what each line - or <mark style="background-color:green;">**instruction**</mark> - tells it to do. However, sometimes the program has special instructions called <mark style="background-color:green;">**loops**</mark>, <mark style="background-color:green;">**control structures**</mark>, and <mark style="background-color:green;">**functions**</mark> that make the computer do things in a different order. These instructions can make the computer repeat certain actions many times, or skip over certain lines of code altogether. Don't worry if you don't understand these concepts yet, we'll be talking more about them soon.

<img src="../.gitbook/assets/file.excalidraw (2).svg" alt="A program is a set of instructions that are executed from top to bottom." class="gitbook-drawing">

An instruction is telling the computer what to do. There are different types of instructions, and they are used in combination to solve problems. In a program, we use instructions to tell a computer to:

* Calculate things.
* Perform actions.
* Remember things.
* Do things over and over again.
* Do one thing or the other, depending on the outcome of a decision.
* Recycle things we taught it how to do, so we don't have to repeat ourselves.

The above list of things a computer can do translate into five general types of instructions in programming that you will need to understand and master throughout the LiFi-project:

1. <mark style="background-color:green;">**Commands**</mark> (_perform actions_)
2. <mark style="background-color:green;">**Variables**</mark> (_remember things_)
3. <mark style="background-color:green;">**Loops**</mark> (_do things over and over_)
4. <mark style="background-color:green;">**Control structures**</mark> (_do one thing or the other_)
5. <mark style="background-color:green;">**Functions**</mark> (_recycle things we taught it_)

Wait, that's only five. But the list of things a computer can do contains 6 elements. So, what about the first one: _calculate things_? Calculations are an important part of any instruction, and in programming perform calculations using <mark style="background-color:green;">**expressions**</mark>. Depending on the outcome, we can distinguish different types of expressions, which we'll introduce later.

<img src="../.gitbook/assets/file.excalidraw (5).svg" alt="An instruction can be different things in a program." class="gitbook-drawing">

The great news is: Once you understand the concept behind each of the types of instructions and expressions, you can read and write almost any program, no matter the complexity. These concepts are the DNA of every program. Of course, it takes practice. And you may still have to look up specific keywords for the language you are programming in. But that's where [Google](https://app.gitbook.com/u/5a55d1d8d10859002f1ae2f5), [Stack Overflow](https://stackoverflow.com/) or [ChatGPT](https://chat.openai.com/chat) come in. Seriously, they are every programmer's best buddies. Learn to use them.

## An Example Program

To explain the different types of instructions a program can contain, let's look at a concrete example. You find this example in the [GitHub repository](https://github.com/winf-hsos/LiFi-code/blob/main/examples/square\_root.py) under `examples\square_root.py`:

{% code title="square_root.py" lineNumbers="true" %}
```python
import sys
print("I can calculate square roots!")

number = input("A number, please: ")
number = int(number)

if number < 0:
    print("Cannot extract roots from negative numbers.")
    sys.exit()

a = number / 2
b = number / a

while(abs(a - b) > 0.00001):
    a = (a + b) / 2
    b = number / a

print(f"The square root of { number } is { a }")
```
{% endcode %}

The program asks the user for a number and approximates the square root using the [Babylonian root extraction algorithm](https://en.wikipedia.org/wiki/Methods\_of\_computing\_square\_roots). We will talk more about algorithms later in this course. For now, all you need to know is that an <mark style="background-color:green;">**algorithm**</mark> is a recipe to solve a specific problem.

Try running the program from the command line in Visual Studio Code and enter a positive number. The program should output the approximate square root of that number. Run it again, but this time enter a negative number and see what happens.

The illustration below is a schematic version of the same program and highlights the different types of instructions it contains. In the following, I walk you through each instruction and explain how they work.

<img src="../.gitbook/assets/file.excalidraw (4).svg" alt="The example program contains all five different types of instructions." class="gitbook-drawing">

### Commands

### Variables

Think of a variable as a container with a label on it. You can put things into the container and at any time you can ask for the content of the container, given you know the container's label. You can change the content of the container as you like at any time.

In a program, a variable is actually a pointer to an address in the computer's main memory. By calling the variable by its name, you are taken to this particular location in the computer's memory, and you can access whatever has been stored there. You can also overwrite the memory location with a value of your choice. A memory address is simply a number that identifies a specific location in memory. Variables exist, so we can store and access things in memory from within our program.&#x20;

We define a variable in Python by writing the desired name and assigning a value using the `=` symbol:

```python
a = number / 2
```

We are more or less free in choosing a variable's name. There are only a few rules and some conventions:

* Variable names should start with a small letter (_convention_).&#x20;
* Variables names cannot start with a number (_rule_).
* Variable names cannot contain any special characters, except the underscore "`_`" (_rule_).
* Variable names should be speaking so that we can infer what the variable's original intentional use was (_convention_).
* When a variable name is composed of more than one word, we use an underscore to connect the two (or more) words (as in `last_name`). An alternative would be so-called camel-casing, where the two words are not separated, but a new word starts with a capital letter (e.g., `lastName`). Camel-casing is not conventional in Python.

### Loops

### Control structures

### Functions

### Expressions

## Don't Repeat Yourself!

An important principle in programming is "Don't Repeat Yourself". Code that we need in several places of our program should be given a name and wrapped in a function. We saw how to do this [earlier in this section](programs.md#5.-functions). We can simply call functions like any other command from anywhere in our program.&#x20;

### Modules

If we put all our custom created, useful functions into a file and call it, for example, `useful_funcs.py` ,we have created a so-called <mark style="background-color:green;">**module**</mark>.

<img src="../.gitbook/assets/file.excalidraw (2) (2).svg" alt="A module is a collection of useful functions in a Python-file." class="gitbook-drawing">

The great benefit of modules is that we can reuse and import them in different programs. These can be our programs or the program's from someone else. The latter requires that person to have a copy of our module:

<img src="../.gitbook/assets/file.excalidraw (3) (2).svg" alt="A module can be imported by another program." class="gitbook-drawing">



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

It is important to note that a library can contain not just functions, but is often used to declare costant values, too. This is in fact a use case in our LiFi-project.
