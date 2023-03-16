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

In the world of computing, binary numbers play a crucial role as the fundamental language that drives our digital devices. While we're accustomed to using the decimal system for everyday calculations, it is essential to understand the binary system to comprehend how computers process and store data. In this lesson, we will explore the concept of <mark style="background-color:green;">**binary numbers**</mark>, compare them to the decimal system, and delve into the general concept of number systems and their workings.

## Number Systems

A number system is a method for representing numbers using a set of symbols. These systems provide a standardized way to express values and perform arithmetic operations. The two primary components of a number system are its <mark style="background-color:green;">**base**</mark> (or radix) and the set of symbols it uses. The base of a number system defines the number of unique symbols it employs.

## Counting on Ten Fingers

The <mark style="background-color:green;">**decimal system**</mark>, also known as base-10, is the most widely used number system worldwide. It employs ten distinct digits: 0, 1, 2, 3, 4, 5, 6, 7, 8, and 9. The system's base 10 likely originated from the fact that humans have ten fingers, making it a natural and intuitive choice for counting. In the decimal system, each position in a number represents a power of 10. For example, in the number 395, the digit 3 represents $$3\times 10^2$$, 9 represents $$9\times 10^1$$, and 5 represents $$5\times 10^0$$.

## The Language of Computers

In contrast, the <mark style="background-color:green;">**binary system**</mark>, also known as base-2, uses only two digits: 0 and 1. Each position in a binary number represents a power of 2. For example, the binary number 1101 represents the decimal number 13, calculated as:

$$
1\times 2^3 + 1\times 2^2 + 0 \times 2^1 + 1 \times 2^0
$$

The binary system's simplicity makes it ideal for use in digital devices, where data is stored and transmitted as electrical signals with two distinct states: on (1) and off (0).

Computers utilize the binary system for all operations, including arithmetic, logic, and data storage. While binary numbers might seem less intuitive for humans, they provide the foundation for the digital world that powers our modern technology.
