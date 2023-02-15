---
description: >-
  Before we start learning to code, we need to set up our development and
  testing environment.
---

# 1 - Development Environment

## Brick Viewer and Brick Daemon

For the LiFi-project, your team uses hardware from a small German start-up company called [Tinkerforge](http://tinkerforge.com/). To jump-start working with the hardware components, Tinkerforge provides two pieces of software, both are open source:

* The [Brick Daemon](https://www.tinkerforge.com/en/doc/Software/Brickd.html), which is a small service that runs in the background of your computer and allows working with a hardware stack that is connected to your computer via USB.
* The [Brick Viewer](https://www.tinkerforge.com/en/doc/Software/Brickv.html), which is a small software application with a <mark style="background-color:green;">**graphical user interface**</mark> <mark style="background-color:green;"></mark><mark style="background-color:green;"></mark> <mark style="background-color:green;"></mark><mark style="background-color:green;">**(GUI)**</mark>. This software allows connecting to the hardware devices and test their functionality using a graphical interface.

Both software are available for the <mark style="background-color:green;">**operating systems (OS)**</mark> Windows, Mac, and Linux. A description for each operating system is available on the Tinkerforge documentation website.

## Visual Studio Code as our IDE

When we write a program, we essentially type instructions into a text file. The text file can have a specific <mark style="background-color:green;">**file extension**</mark>, which differs depending on which <mark style="background-color:green;">**programming language**</mark> the program is written in. Your team develops the necessary software using the <mark style="background-color:green;">**Python**</mark> programming language, and the file extension for Python is `.py`.

To edit a Python program, we could use any text editor already installed on our computer. If we are running Windows, we could open Notepad and write our program. However, Notepad does not provide any features that are helpful for writing a program in Python (apart from typing text). That's why we are going to use a text editor that is specifically tailored to writing programs with Python, or any other programming language for that matter. We call such a text editor an <mark style="background-color:green;">**Integrated Development Environment**</mark>, or <mark style="background-color:green;">**IDE**</mark>.

What do we mean by that? Here are some of the features that an IDE like Visual Studio has and that you will soon learn to appreciate yourself:

* <mark style="background-color:green;">**Code completion**</mark>: when we type the first letters of a command, a good IDE can guess what this command is and complete the name for us. This saves us a lot of typing, and we do not have to remember all commands.
* <mark style="background-color:green;">**Code formatting**</mark>: while in some programming languages such as JavaScript, formatting our code is helpful to improve the readability, in Python the formatting is actually part of the syntax. This means that there is a difference in having an extra tab or not. An IDE knows how to format code in a specific programming languages and can either give us useful hints or format the code with the push of a button for us altogether.
* <mark style="background-color:green;">**Warnings and errors**</mark>: a good IDE can warn us about mistakes we make before we run the code. For instance, when we mistype the name of a variable, we get a warning that this variable is unknown. Even better, we might get the option to correct the spelling error with a click.
* <mark style="background-color:green;">**Debugging**</mark>: when our code doesn't do what we expect it to, there is an error somewhere. In software, these errors are mostly called <mark style="background-color:green;">**bugs**</mark>. Bugs can be hard to find, so it would be helpful to get some assistance from the IDE. Luckily, most IDEs support debugging with a special execution mode, where we can go through a program step by step and observe what happens to things like variables in each step. This is very helpful to identify where the bug is hiding. Or to find out that it doesn't work the way we thought it would.

You can download and install Visual Studio Code for any operating system from the following website:

{% embed url="https://code.visualstudio.com/download" %}

## Python as our programming language

{% embed url="https://www.python.org/downloads/" %}

## Git to manage our code&#x20;

{% embed url="https://git-scm.com/downloads" %}
