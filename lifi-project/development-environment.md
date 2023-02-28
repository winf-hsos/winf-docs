---
description: >-
  Before we start learning to code, we need to set up our development and
  testing environment.
---

# 2 - Development Environment

{% hint style="info" %}
This section is relevant for [Exercise 1: Ready, Set, Smoke](https://github.com/winf-hsos/lifi-exercises/raw/main/exercises/01\_exercise\_ready\_set\_smoke.pdf).
{% endhint %}

## Summary

In this section, you'll learn:

* Which software you need for the LiFi-project.
* How you can test the hardware components with the Brick Viewer from Tinkerforge.
* What an integrated development environment (IDE) is and why it is useful.
* What Python is, and why we choose it as our programming language in this project.
* What Git is and why it is a useful tool in software projects.

## Brick Viewer and Brick Daemon

For the LiFi-project, your team uses hardware from a small German start-up company called [Tinkerforge](http://tinkerforge.com/). To jump-start working with the hardware components, Tinkerforge provides two pieces of software, both are open source:

* The [Brick Daemon](https://www.tinkerforge.com/en/doc/Software/Brickd.html), which is a small service that runs in the background of your computer and allows working with a hardware stack that is connected to your computer via USB.
* The [Brick Viewer](https://www.tinkerforge.com/en/doc/Software/Brickv.html), which is a small software application with a <mark style="background-color:green;">**graphical user interface**</mark> <mark style="background-color:green;"></mark><mark style="background-color:green;"></mark> <mark style="background-color:green;"></mark><mark style="background-color:green;">**(GUI)**</mark>. This software allows connecting to the hardware devices and test their functionality using a graphical interface.

Both software are available for the <mark style="background-color:green;">**operating systems (OS)**</mark> Windows, Mac, and Linux. A description for each operating system is available on the Tinkerforge documentation website.

## Visual Studio Code

When we write a program, we type s-called <mark style="background-color:green;">**instructions**</mark> into a text file. The text file can have a specific <mark style="background-color:green;">**file extension**</mark>, which differs depending on which <mark style="background-color:green;">**programming language**</mark> the program is written in. Your team develops the necessary software using the <mark style="background-color:green;">**Python**</mark> programming language, and the file extension for Python is `.py`.

To edit a Python program, we could use any text editor already installed on our computer. If we are running Windows, we could open Notepad and write our program. However, Notepad does not provide any features that are helpful for writing a program in Python (apart from typing text). That's why we are going to use a text editor that is specifically tailored to writing programs with Python, or any other programming language for that matter. We call such a text editor an <mark style="background-color:green;">**Integrated Development Environment**</mark>, or <mark style="background-color:green;">**IDE**</mark>.

What do we mean by that? Here are some of the features that an IDE like Visual Studio has and that you will soon learn to appreciate yourself:

* <mark style="background-color:green;">**Code completion**</mark>: when we type the first letters of a command, a good IDE can guess what this command is and complete the name for us. This saves us a lot of typing, and we do not have to remember all commands.
* <mark style="background-color:green;">**Code formatting**</mark>: while in some programming languages such as JavaScript, formatting our code is helpful to improve the readability, in Python the formatting is actually part of the syntax. This means that there is a difference in having an extra tab or not. An IDE knows how to format code in a specific programming languages and can either give us useful hints or format the code with the push of a button for us altogether.
* <mark style="background-color:green;">**Warnings and errors**</mark>: a good IDE can warn us about mistakes we make before we run the code. For instance, when we mistype the name of a variable, we get a warning that this variable is unknown. Even better, we might get the option to correct the spelling error with a click.
* <mark style="background-color:green;">**Debugging**</mark>: when we write code, we expect it to do certain things, but sometimes it doesn't work the way we thought it would. When this happens, we say there's an error in our code, and we call these errors 'bugs'. Finding bugs in our code can be hard, but luckily, we can get some help from our IDE. Most IDEs have a special execution mode called 'debugging', which lets us go through our code step by step and see what's happening to things like variables at each step. This is really helpful for identifying where the bug is hiding, or for figuring out that our code isn't doing what we thought it would.

You can download and install Visual Studio Code for any operating system from the following website:

{% embed url="https://code.visualstudio.com/download" %}

## Python

Python is a widely-adopted programming language that is especially well suited for first-time-programmers. Download and install Python in the latest version from the following website:

{% embed url="https://www.python.org/downloads/" %}

## Git

In software development, we often work in teams and need to share code with our team members. This is similar to when you want to work on a text document or a spreadsheet together with your classmates. It would be nice to have a tool that helps you with that. Git is that tool, and you'll use it in this course primarily to get the example code for the LiFi-project from the provided [GitHub repository](https://github.com/winf-hsos/LiFi-code). Download and install Git on your computer:&#x20;

{% embed url="https://git-scm.com/downloads" %}

If you have successfully installed all software listed above, you are done with this section. We will test wether everything works using a so-called <mark style="background-color:green;">**smoke test**</mark>.
