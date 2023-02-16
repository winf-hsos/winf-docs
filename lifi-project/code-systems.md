# 5 - Code Systems

{% hint style="info" %}
This section is relevant for [Exercise 2: Logic with the LED](https://github.com/winf-hsos/lifi-exercises/raw/main/exercises/02\_exercise\_logic\_with\_the\_led.pdf).
{% endhint %}

## Summary

In this section, you'll learn:

* How colors can be specified using a code system called the <mark style="background-color:green;">**RGB code.**</mark>
* What a code system is and what it is made of.

## The RGB code

In the previous section about [the-led.md](the-led.md "mention"), we briefly touched the RGB code and used it to set the LED's color to green. We did this using a function provided by the Tinkerforge <mark style="background-color:green;">**API**</mark> called `set_rgb_value`. When calling this function, we passed three numbers to it:

```python
led.set_rgb_value(0, 255, 0)
```

### RGB code in a nutshell

It is now time to understand what these three numbers mean and what values we can assign to each of them. The short answer is: the numbers belong to the RGB code, which is a code system that uses 3 <mark style="background-color:green;">**bytes**</mark> to represent one of roughly 16 million colors. The abbreviation RGB stands for the three colors **r**ed, **g**reen, and **b**lue. The RGB code specifies the intensity for each of these three basic colors to create the desired resulting color. For each of the three, one byte is reserved, hence 3 bytes in total. Knowing that, we understand why the above code line produces a pure green color. All basic colors are set to zero, except green, which is set to 255, the largest possible number we can store in one byte.

That was a lot. Let's unpack this.

### Why \~16 million colors?

With the RGB code, we can represent exactly 16,777,216 different colors. That's what I meant above by saying "roughly 16 million".

### What is a byte and why 255?

## Key Points

* Computers internally only work with zeroes and ones. This appears to pose a problem to anyone who, for example, wants to use a computer to process text with letters and other symbols. How can a computer represent letters, when all it can store and process are 0 and 1?
* The answer lies in the permutations we can obtain with a given number of 0 and 1. Say we have 8 bits (that is, 8 switches that can either be on or off). With those 8 bits, we can create $$2^7 = 256$$ different permutations of zeroes and ones. If we now assign a symbol to each of those permutations, we arrive at what we call a _code system_. A symbol can be anything we like. When we look at text processing, a symbol might be A, B, C, 1, 2, 3 and so forth. But it can also be a color or a sound, or a command to the printer.
* We can calculate the number of permutations we need for our code system if we know the structure of a message we want to transmit or store.

## Material

| Title                                                                                                                                                                      | Type         | PDF                                                                                                      |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | -------------------------------------------------------------------------------------------------------- |
| [Wirtschaftsinformatik #02 - Codes](https://docs.google.com/presentation/d/1XcdMGmzX-D5byd140JNXZ56twkQgLRto5Wr7IvM3bBY/preview)                                           | Slides       | [🔗](https://docs.google.com/presentation/d/1XcdMGmzX-D5byd140JNXZ56twkQgLRto5Wr7IvM3bBY/export/pdf)     |
| [Measuring Information](https://www.khanacademy.org/computing/computer-science/informationtheory/moderninfotheory/v/how-do-we-measure-information-language-of-coins-10-12) | YouTube      | -                                                                                                        |
| [Chapter 2 - Codes and Combinations from \[1\]](http://osca.hs-osnabrueck.de/)                                                                                             | Book Chapter | -                                                                                                        |
| [Chapter 9 - Bit by Bit by Bit from \[1\]](http://osca.hs-osnabrueck.de/)                                                                                                  | Book Chapter | -                                                                                                        |
| [Exercise - Information & Codes](https://docs.google.com/document/d/1yuHOp94Ce\_CTP6e5mCwLxKfgIctlUZgN44r6ZES8JC0/preview)                                                 | Exercise     | [🔗](https://docs.google.com/document/d/1yuHOp94Ce\_CTP6e5mCwLxKfgIctlUZgN44r6ZES8JC0/export?format=pdf) |
