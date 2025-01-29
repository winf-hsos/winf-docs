---
description: >-
  In this lesson, we introduce the notion of a program as a set of instructions.
  But what exactly is an instruction? And what different kinds exist?
---

# Programs

<details>

<summary>Summary</summary>

In this lesson, you'll learn:

* That a program is a set of instructions.
* What the five types of instructions are that make up every program.
* What an expression is and what types exist.

This lesson concerns the question of how we can solve problems with digital computers and adds to your understanding of programming.

This lesson is relevant for [Exercise 2: Logic With The LED](https://winf-hsos.github.io/lifi-exercises/exercises/02_exercise_logic_with_the_led.pdf).

</details>

## Instructions

A <mark style="background-color:green;">**program**</mark> is a set of instructions that are executed by a computer. A program is written as plain text, and we usually use a separate line for a new instruction. To write a program, all we need is a simple text editor, although in the LiFi-project, we prefer a [complete development environment](../lifi-project/v0-setup/development-environment.md).&#x20;

When a computer executes a program, it steps through the program one line at a time and does what each line - or <mark style="background-color:green;">**instruction**</mark> - tells it to do. However, sometimes the program has special instructions called <mark style="background-color:green;">**loops**</mark>, <mark style="background-color:green;">**control structures**</mark>, and <mark style="background-color:green;">**functions**</mark> that make the computer do things in a different order. These instructions can make the computer repeat certain actions many times, or skip over certain lines of code altogether. Don't worry if you don't understand these concepts yet, we'll be talking more about them soon.

<img src="../.gitbook/assets/file.excalidraw (4) (2).svg" alt="A program is a set of instructions that are executed from top to bottom." class="gitbook-drawing">

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

<img src="../.gitbook/assets/file.excalidraw (5) (1) (2).svg" alt="An instruction can be different things in a program." class="gitbook-drawing">

The great news is: Once you understand the concept behind each of the types of instructions and expressions, you can read and write almost any program, no matter the complexity. These concepts are the DNA of every program. Of course, it takes practice. And you may still have to look up specific keywords for the language you are programming in. But that's where [Google](https://app.gitbook.com/u/5a55d1d8d10859002f1ae2f5), [Stack Overflow](https://stackoverflow.com/) or [ChatGPT](https://chat.openai.com/chat) come in. Seriously, they are every programmer's best buddies. Learn to use them.

## Algorithms And Programs

To explain the different types of instructions a program can contain, let's look at a concrete example. You find this example in the [GitHub repository](https://github.com/winf-hsos/LiFi-code) under [`problem_solutions\square_root.py`](https://github.com/winf-hsos/LiFi-code/blob/main/problem_solutions/square_root.py):

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

while abs(a - b) > 0.00001:
    a = (a + b) / 2
    b = number / a

print(f"The square root of { number } is { a }")
```
{% endcode %}

The program asks the user for a number and approximates the square root using the [Babylonian root extraction algorithm](https://en.wikipedia.org/wiki/Methods_of_computing_square_roots). We will talk more about algorithms later in this course. For now, all you need to know is that an <mark style="background-color:green;">**algorithm**</mark> is a recipe to solve a specific problem. And a program is the implementation of an algorithm in a specific programming language, ready for a computer to execute.

<img src="../.gitbook/assets/file.excalidraw (3) (1).svg" alt="An algorithm is a step-by-step recipe to solve a specific problem. A program can implement an algorithm to make it executable." class="gitbook-drawing">

Try running the program from the command line in Visual Studio Code and enter a positive number. The program should output the approximate square root of that number. Run it again, but this time enter a negative number and see what happens.

The illustration below is a schematic version of the same program and highlights the different types of instructions it contains. In the following, I walk you through each type of instruction and explain how it works.

<img src="../.gitbook/assets/file.excalidraw (1) (6).svg" alt="The example program contains all five different types of instructions." class="gitbook-drawing">

## Commands

Commands tell a computer to perform some action. A command can be some built-in action that the programming language, such as Python, inherently knows. The `import` command is an example of this type of command. It is just there and belongs to Pythons standard vocabulary.

The second type of command are functions calls. We can further distinguish functions into different types, depending on their source:

* A function can be imported from an <mark style="background-color:green;">**internal module**</mark>. An example is the `sys` module used in the program above.  The [`sys` module](https://docs.python.org/3/library/sys.html) allows accessing "_system-specific parameters and functions_", such as the `exit` function we applied above. Another example for an internal module is `time`. A list of all Python-internal modules can be found [online](https://docs.python.org/3/py-modindex.html).
* Alternatively, a function can be imported from an <mark style="background-color:green;">**external module**</mark>. These are modules that don't belong to the internal core of the Python programming language, but are rather written and published by a third party. An example is the [Tinkerforge Python API](https://www.tinkerforge.com/en/doc/Software/API_Bindings_Python.html), which we'll learn about in the next lesson when we use it to control the LED.
* A command can also be a function we wrote and call in our program. We call these functions custom- or <mark style="background-color:green;">**user-defined functions**</mark>.

When we see a command in a Python program, we cannot say for sure which of the above types it is. Calling a function looks the same, regardless of where it was defined. There is a way to find out, though. You can move the cursor somewhere on the command's name and perform a right-click. Now, select the option "Go to Definition" or hit the F12 key. Visual Studio Code will take you to the place where the command - or the function behind the command - was defined.

## Variables

Think of a variable as a box with a label on it. You can put things into the box, and at any time you can ask for its content, given you know the label. You can change the content of the box as you like at any time.

<img src="../.gitbook/assets/file.excalidraw (5) (1).svg" alt="Variables are like boxes with a label. We can put things into them and take them out as needed." class="gitbook-drawing">

In a program, a variable is really a pointer to an address in the computer's <mark style="background-color:green;">**main memory**</mark>. By calling the variable by its name, you are taken to this particular location in the computer's memory, and you can access whatever has been stored there. You can also overwrite the memory location with a value of your choice. A memory address is simply a number that identifies a specific location in memory. Variables allow us to utilize the computer's memory to store and access things we need in our program.&#x20;

We define a variable in Python by writing the desired name and assigning a value using the `=` symbol:

```python
a = number / 2
```

We are more or less free in choosing a variable's name. There are a few rules and some conventions:

* Variable names should start with a small letter (_convention_).&#x20;
* Variables names cannot start with a number (_rule_).
* Variable names cannot contain any special characters, except the underscore "`_`" (_rule_).
* Variable names should be speaking so that we can infer what the variable's original intentional use was (_convention_).
* When a variable name is composed of more than one word, we use an underscore to connect the two (or more) words (as in `last_name`). An alternative would be so-called camel-casing, where the two words are not separated, but a new word starts with a capital letter (e.g., `lastName`). Camel-casing is not conventional in Python.

## Loops

In programming, a loop is a way to repeat a section of code multiple times until a certain condition is met. It is like a computerized version of a repetitive task that humans might do. Loops can save time and effort by automating repetitive tasks, and they are commonly used in programming to perform tasks such as iterating over data or waiting for user input.

In the code example above, the <mark style="background-color:green;">**while-loop**</mark> is used to calculate the square root of a number. The loop starts with an initial guess for the square root, and then it repeatedly improves the guess until it is within a certain margin of error. The condition for the loop to continue is that the difference between the current guess and the previous guess is greater than a small threshold. The loop ends when the difference is smaller than the threshold, meaning that the guess has converged to the actual square root of the number.

```python
while abs(a - b) > 0.00001:
    a = (a + b) / 2
    b = number / a
```

The while-loop is well suited if we can specify a condition that must be true to keep looping. Once that condition becomes false, the loop exits and the program continues with the next instruction. An alternative type of loop is the <mark style="background-color:green;">**for-loop**</mark>, which we can use when we can specify the number of times we want to loop through the code. We will use this type of loop later in this course.

<img src="../.gitbook/assets/file.excalidraw (4) (1).svg" alt="" class="gitbook-drawing">

Overall, loops are an essential type of instruction in any program that can help simplify complex tasks and automate repetitive processes.&#x20;

## Control Structures

An <mark style="background-color:green;">**if-statement**</mark> is a type of control structure in programming that allows a program to make decisions based on a condition. In the example code snippet, the if-statement is used to check whether the number entered by the user is negative or not:

```python
if number < 0:
    print("Cannot extract roots from negative numbers.")
    sys.exit()
```

Here, the condition being checked is whether the value of the `number` variable is less than zero. If the condition is true (i.e., if the number is negative), then the program will print a message saying that square roots cannot be extracted from negative numbers, and then exit the program using the `exit` function. If the condition is false (i.e., if the number is non-negative), then the program will skip over the if-statement and continue executing the rest of the code.

An if-statement allows a program to make different decisions based on the values of certain variables or other conditions, which essential for controlling the flow of the program.

<img src="../.gitbook/assets/file.excalidraw (3) (4).svg" alt="An if-statement is a type of control structure that branches a program into two or more blocks." class="gitbook-drawing">

## Functions

A function is a block of code that performs a specific task and can be reused throughout the same or even in other programs. It takes optional input parameters, processes them in a set of instructions, and returns a value or performs some action.

In the example program, we can extract the functionality of calculating the square root of a number and turn it into a function that we can reuse elsewhere in the program. Here's an example of how we can define and use the function:

{% code lineNumbers="true" %}
```python
import sys

def extract_square_root(number):

    if number < 0:
        print("Cannot extract roots from negative numbers.")
        sys.exit()

    a = number / 2
    b = number / a

    while(abs(a - b) > 0.00001):
        a = (a + b) / 2
        b = number / a

    return a

print("I can calculate square roots!")
number = input("A number, please: ")
number = int(number)

sqrt= extract_square_root(number)

print(f"The square root of { number } is { sqrt}")
```
{% endcode %}

In Python, functions are defined with the `def` command followed by the name of the function. We gave the function the name `extract_square_root`, and it takes one parameter, called `number`. If the function had more than one parameter, which is possible, we would list the parameter names as a comma-separated list.&#x20;

Based on the parameter's value, the function performs the same steps as our code did before. But instead of printing the result to the console, the function uses a `return` statement to quit the function and return the result to the caller. The caller can be found in line 22, where we use the function as a command and store the result in a variable called `sqrt`. Finally, we print the result to the console (line 24).

The main benefit of having a function to extract square roots is that we can simply ask the user for another number after we printed our first result:

```python
another_number = input("Give me more difficult number: ")
sqrt = extract_square_root(another_number)
print(f"The square root of { another_number } is { sqrt }")
```

## Expressions

Expressions are different from instructions. An expression is merely a set of symbols that can be evaluated to get a result. The symbols used in an expression can be different things:

* <mark style="background-color:green;">**Literal values**</mark>, such as the <mark style="background-color:green;">**integer numbers**</mark> `1`, `2`, `3`, or the <mark style="background-color:green;">**real numbers**</mark> `0.5` or `3.14`, or character strings like `"abc"` and `"xyz"`. A literal value can also be a so-called <mark style="background-color:green;">**boolean value**</mark>, which is either `True` or `False`.&#x20;
* <mark style="background-color:green;">**Operators**</mark>, like the <mark style="background-color:green;">**arithmetic operators**</mark> `+`, `-`, `/` or `*`. A symbol can also be a <mark style="background-color:green;">**logical operator**</mark>, such as `==` (equals), `>` (larger than) or `<` (less than).
* Functions that return a literal value. For example, the function `extract_square_root` from the example above, which returns a real number that represents the approximated square root.

Instructions make use of expressions for different use cases. A command might require values for some parameters that we can specify using an expression. A while-loop requires an expression that evaluates to either `True` or `False`, thus, a <mark style="background-color:green;">**boolean expression**</mark>. The same is true for control structures like the if-statement.

<img src="../.gitbook/assets/file.excalidraw (2) (1) (2) (1).svg" alt="Expressions can be literal values or literal values connected by operators." class="gitbook-drawing">

With the five types of instructions and expressions, you know the ingredients for any program you will ever write or encounter. We are now prepared to learn about our first hardware device and how to control it from a program.
