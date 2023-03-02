# 4 - Programs ⭐

{% hint style="info" %}
This section is relevant for [Exercise 1: Ready, Set, Smoke](https://github.com/winf-hsos/lifi-exercises/raw/main/exercises/01\_exercise\_ready\_set\_smoke.pdf).
{% endhint %}

## Summary

In this section, you'll learn:

* What a program is and what our first program looks like.
* What the five types of instructions are that make up every program.

This section concerns the question of how we can solve problems with digital computers adds to your understanding of programming.&#x20;



<img src="../.gitbook/assets/file.excalidraw (2).svg" alt="This section helps you learn more about programming." class="gitbook-drawing">

## Code For This Section

This section introduces a program for the smoke test, which we go through step-by-step. You can find [the program code on GitHub](https://github.com/winf-hsos/LiFi-code/blob/main/examples/smoke\_test.py), and I recommend you check out the entire [LiFi-code repository](https://github.com/winf-hsos/LiFi-code) with all examples in this course.

## What Is A Program?

### Instructions

A program is a set of instructions for a computer to execute. A program is written as plain text, and all we need is a basic text editor, although in the LiFi-project, we prefer a [complete development environment](development-environment.md).&#x20;

When a computer runs a program, it goes through the program one line at a time and does what each line - or <mark style="background-color:green;">**instruction**</mark> - tells it to do. However, sometimes the program has special instructions called <mark style="background-color:green;">**loops**</mark>, <mark style="background-color:green;">**control structures**</mark>, and <mark style="background-color:green;">**functions**</mark> that make the computer do things in a different order. These instructions can make the computer repeat certain actions many times, or skip over certain lines of code altogether. Don't worry if you don't understand these concepts yet, we'll be talking more about them soon.

An instruction is telling the computer what to do. There are different types of instructions, and they are used in combination to solve problems. In a program, we use instructions to tell a computer to:

* Remember things.
* Calculate things.
* Do things over and over again.
* Do one thing or the other, depending on the outcome of a decision.
* Recycle things we taught it how to do, so we don't have to repeat ourselves.

### Five types of instructions in programming

The above list of things a computer can do translate into five general types of instructions in programming that you will need to understand and master throughout the LiFi-project:

1. <mark style="background-color:green;">**Variables**</mark> (_remember things_)
2. <mark style="background-color:green;">**Expressions**</mark> (_calculate things_)
3. <mark style="background-color:green;">**Loops**</mark> (_do things over and over_)
4. <mark style="background-color:green;">**Control structures**</mark> (_do one thing or the other_)
5. <mark style="background-color:green;">**Functions**</mark> (_recycle things we taught it_)

The great news is: Once you understand the concept behind each of them, you can read and write almost any program, no matter the complexity. These concepts are the DNA of every program. Of course, it takes practice. And you may still have to look up specific keywords for the language you are programming in. But that's where [Google](https://app.gitbook.com/u/5a55d1d8d10859002f1ae2f5), [Stackoverflow](https://stackoverflow.com/) or [ChatGPT](https://chat.openai.com/chat) come in. Seriously, they are every programmer's best buddies. Learn to use them.

### 1. Variables

Think of a variable as a container with a label on it. You can put things into the container and at any time you can ask for the content of the container, given you know the container's label. You can change the content of the container as you like at any time.

In a program, a variable is actually a pointer to an address in the computer's main memory. By calling the variable by its name, you are taken to this particular location in the computer's memory, and you can access whatever has been stored there. You can also overwrite the memory location with a value of your choice. A memory address is simply a number that identifies a specific location in memory. Variables exist, so we can store and access things in memory from within our program.&#x20;

We define a variable in Python by writing the desired name and assigning a value using the `=` symbol:

```python
last_name = "Meseth"
first_name = "Nicolas"Pyth
age = 41
```

We are more or less free in choosing a variable's name. There are only few rules and some conventions:

* Variable names should start with a small letter (_convention_).&#x20;
* Variables names cannot start with a number (_rule_).
* Variable names cannot contain any special characters, except the underscore "`_`" (_rule_).
* Variable names should be speaking so that we can infer what the variable's original intentional use was (_convention_).
* When a variable name is composed of more than one word, we use an underscore to connect the two (or more) words (as in `last_name`). An alternative would be so-called camel-casing, where the two words are not separated, but a new word starts with a capital letter (e.g., `lastName`). Camel-casing is not conventional in Python.

### 2. Expressions

### 3. Loops

### 4. Control structures

### 5. Functions
