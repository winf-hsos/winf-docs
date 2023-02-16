---
description: >-
  After the hardware is in one piece and the software is installed, let's run
  our first tests to see whether everything works properly.
---

# 3 - Smoke Tests

{% hint style="info" %}
This section is relevant for [Exercise 1: Hardware Assembly, Development Environment, and Smoke Test](https://github.com/winf-hsos/lifi-exercises/raw/main/exercises/01\_exercise\_hardware\_assembly.pdf).
{% endhint %}

## What does a smoke test do?

The term <mark style="background-color:green;">**smoke test**</mark> in industrial engineering and software development describes an attempt to run a new system for the first time to see whether there are any major issues. The term 'smoke test' likely originated in the plumbing industry, where smoke was blown into a new pipe system to detect any leaks. For us, the smoke test means that we connect the hardware stack to a computer and test whether all components and their functionalities are working. For this purpose, we can use the [Brick Viewer from Tinkerforge](https://www.tinkerforge.com/en/doc/Software/Brickv.html), which we installed in the [previous section](development-environment.md). Or we can use the Tinkerforge Python <mark style="background-color:green;">**API**</mark> and perform the same smoke test from a program.

We'll perform two similar smoke tests in this section:

1. Connect to the hardware kit from the Tinkerforge Brick Viewer and test the device's most important functions.
2. Connect to the hardware kit from a Python program and test at least of each device's functions.

The tests give us confidence that all devices are intact, everything is wired correctly, all the identifiers were collected properly, and our development environment is installed and configured. If the test result is positive, that is.

## The program-based smoke test

The following code contains the full smoke test for our program-based version:

```python
HOST = "localhost"
PORT = 4223
UID = "xxxxx" # Change to the UID of your Master Brick

from tinkerforge.bricklet_rgb_led import BrickletRGBLED

ipcon = IPConnection()
master = BrickMaster(UID, ipcon)
ipcon.connect(HOST, PORT)
```

You are running this code during your first exercise. In the following, we examine the different parts of the code a bit closer and introduce our first concepts in programming. Don't worry, we will learn about each concept in more detail later on. This is just to give you a rough overview of how the smoke test program works.

### Five basic concepts in programming

Throughout the LiFi-project, we'll need to understand and master the following five basic concepts in programming:

1. Variables
2. Expressions
3. Functions
4. Control Structures
5. Loops

At the end of this section, you are going to solve your first mandatory exercise, for which you will need to understand and apply all of them. But don't worry, we'll introduce them step by step in the following.

#### Variables

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
