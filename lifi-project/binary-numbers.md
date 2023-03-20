---
description: >-
  To understand how computers work, we first must understand how a number system
  with only ones and zeroes works.
---

# 7 - Binary Numbers

<details>

<summary>Summary</summary>

This lesson is relevant for [Exercise 3: The Human Operator](https://github.com/winf-hsos/lifi-exercises/raw/main/exercises/03\_exercise\_human\_operator.pdf).

</details>

In the world of computing, <mark style="background-color:green;">**binary numbers**</mark> play a crucial role as the fundamental language that drives our digital devices. While we're accustomed to using the decimal system for everyday calculations, it is essential to understand the binary system to comprehend how computers process and store data. In this lesson, we will explore the concept of binary numbers, compare them to the <mark style="background-color:green;">**decimal system**</mark>, and delve into the general concept of number systems and their workings.

## Number Systems

To better comprehend the binary system, it's crucial to have a grasp of number systems in general. A number system is a method of representing and manipulating numbers using a set of symbols, each of which has a particular value. The most common number system we use is the decimal or <mark style="background-color:green;">**base-10**</mark> system, which employs ten symbols (0 to 9). However, there are other number systems, like the <mark style="background-color:green;">**binary system**</mark> (base-2), with only two symbols (0 and 1).

## The Decimal System

### Counting on Ten Fingers

The <mark style="background-color:green;">**decimal system**</mark>, also known as base-10, is the most widely used number system worldwide. It employs ten distinct digits: 0, 1, 2, 3, 4, 5, 6, 7, 8, and 9. The system's base 10 likely originated from the fact that humans have ten fingers, making it a natural and intuitive choice for counting.

### Location, Location, Location

As with real estate, in number systems, location determines the value of a given symbol. What does that mean? In the decimal system, each position in a number represents a power of 10. For example, in the number 395, the digit 3 represents $$3\times 10^2$$, 9 represents $$9\times 10^1$$, and 5 represents $$5\times 10^0$$.

<img src="../.gitbook/assets/file.excalidraw (10).svg" alt="" class="gitbook-drawing">

The pattern is simple: The rightmost digit is worth $$10^0$$, which is $$1$$. The second digit from the right is worth $$10^1$$, which equals $$10$$. Do you spot the pattern? With every digit we move to the right, the <mark style="background-color:green;">**exponent**</mark> increases by one, while the <mark style="background-color:green;">**base**</mark> stays the same. That's why we call the decimal system the base-10 system.

<img src="../.gitbook/assets/file.excalidraw (9).svg" alt="In the decimal system, the base is 10. The exponent of a digit increases from right to left." class="gitbook-drawing">

As an example, let's examine the decimal number $$2023$$, the year in which the LiFi project was launched. We can apply the general schema with the base set to 10 like this:&#x20;

<img src="../.gitbook/assets/file.excalidraw (6).svg" alt="The decimal number 2023 and how it is calculated using the general number system." class="gitbook-drawing">

## The Octal System

Imagine a cartoon character like Mickey Mouse, who has only four fingers on each hand. In Mickey's world, an <mark style="background-color:green;">**octal**</mark> or <mark style="background-color:green;">**base-8**</mark> system would be more intuitive for counting. This system would use eight symbols (0, 1, 2, 3, 4, 5, 6, and 7) to represent numbers. When Mickey runs out of fingers on one hand, he would start counting on his other hand, just as we do when counting in base-10.

<img src="../.gitbook/assets/file.excalidraw (3).svg" alt="Source: Code: The Hidden Language of Computer Hardware and Software by Charles Petzold, page 101." class="gitbook-drawing">

To determine the decimal value of an octal number, we can apply the same schema we introduced above, but exchange the value of the base with 8:

<img src="../.gitbook/assets/file.excalidraw (2).svg" alt="The octal system uses eight as the base value, and everything else works the same." class="gitbook-drawing">

What if someone told us that the $$2023$$ from above was not a base-10 number, but an octal number? What is the value of the octal number $$2023$$ in the decimal system? Well:

<img src="../.gitbook/assets/file.excalidraw (7).svg" alt="The 2023 interpreted as an octal number. We must always specify the base when working with different systems." class="gitbook-drawing">



## The  Binary System

Now that we have a grasp of number systems in general, let's delve deeper into the binary system, which is the foundation of the digital world. In this system, we use only zeroes and ones as symbols, but can still represent any data.

In our everyday lives, we encounter numerous instances where the binary concept plays a significant role outside the realm of computers. For example, a simple light switch is an excellent illustration of the binary system. It operates in two states: on and off. This seemingly mundane object is a gateway to understanding the fascinating world of digitalization and programming.

A <mark style="background-color:green;">**bit**</mark> is short for <mark style="background-color:green;">**binary digit**</mark> and represents the smallest unit of data in a computer system. It can take one of two values, 0 or 1, much like the on and off states of a light switch. A <mark style="background-color:green;">**byte**</mark>, on the other hand, consists of 8 bits, allowing for $$2^8=256$$ unique combinations. Bytes are the fundamental building blocks for representing data, such as text, images, or sounds, in a digital computer.

<img src="../.gitbook/assets/file.excalidraw (11).svg" alt="A light switch has two states, on and off. Just like a binary digit." class="gitbook-drawing">

The binary system, also known as base-2, uses only two digits: 0 and 1. According to the general schema we introduced above, each position in a binary number represents a power of 2, which is the binary system's base. For example, the binary number $$1101$$ represents the decimal number 13, calculated as:

<img src="../.gitbook/assets/file.excalidraw (4).svg" alt="The binary system is just another number system, but also special, as it is the one with the fewest symbols possible." class="gitbook-drawing">

What if someone told us the number $$2023$$ from above was actually neither decimal nor octal, but binary? We'd call them a liar because the binary system does not know the symbols 2 and 3. It only knows 0 and 1. As an exercise, we could ask the reverse question and transform the decimal number $$2023$$ into is binary representation.

### From Decimal To Binary

To transform from decimal to binary is not possible with the schema from above. We need a different approach here.

<img src="../.gitbook/assets/file.excalidraw (1).svg" alt="How can we transform from the decimal system to the binary system?" class="gitbook-drawing">

The question to ask at the beginning is: What is the largest power of the target system's base (here: 2 as in binary) we can fit into the original decimal number 2023? The ascending powers of two are 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048 and so forth. We can stop here because the last number we listed, 2048, is larger than 2023, the number we aim to convert. Therefore, we don't need the digit that is worth 2048, and we can start with the digit to its left, which is $$2^{10} = 1024$$. Including the $$2^0$$, we now know that the decimal number 2023 needs 11 digits for its binary representation:

<img src="../.gitbook/assets/file.excalidraw (12).svg" alt="" class="gitbook-drawing">



With that knowledge, we can follow a simple algorithm:

1. Subtract the largest required digit worth $$2^{10} = 1024$$ from the decimal number: $$2023-1024 = 999$$. Write down a $$1$$ for the leftmost binary digit.
2. Take the remainder of $$999$$ and check whether it is larger or equal than the next smaller power $$2^9=512$$. If yes, subtract the power from the remainder and write down a $$1$$ for this digit. If not, write down a $$0$$ for this digit and move on to the next smaller power $$2^8=256$$.
3. Repeat the cycle until there is no remainder left.

<img src="../.gitbook/assets/file.excalidraw (8).svg" alt="The algorithm to convert from decimal to binary visually explained." class="gitbook-drawing">



### Why Do Computers Think Binary?

The binary system's simplicity makes it ideal for use in digital devices, where data is stored and transmitted as electrical signals with two distinct states: on (1) and off (0).

Computers utilize the binary system for all operations, including arithmetic, logic, and data storage. While binary numbers might seem less intuitive for humans, they provide the foundation for the digital world that powers our modern technology.

## Further Reading

