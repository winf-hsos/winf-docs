---
description: >-
  A major task in developing the new LiFi solution is programming the necessary
  software. We'll use Python for that. Let's get started with some basics.
---

# 2 - Our First Program ⭐

## Five basic concepts in programming

Throughout the LiFi-project, we'll need to understand and master the following five basic concepts in programming:

1. Variables
2. Expressions
3. Functions
4. Control Structures
5. Loops

At the end of this section, you are going to solve your first mandatory exercise, for which you will need to understand and apply all of them. But don't worry, we'll introduce them step by step in the following.

### Variables

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
* When a variable name is composed of more than one word, we use an underscore to connect the two (or more) words (as in `last_name`). An alternative would be so-called camel-casing, where the two words are not separated, but a new word starts with a capital letter (e.g. `lastName`). Camel-casing is not conventional in Python.

## Programming Exercise

This is your first mandatory programming exercise. You can download the task description as a PDF file below.
