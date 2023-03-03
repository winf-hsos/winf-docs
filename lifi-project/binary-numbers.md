---
description: >-
  To understand how computers work, we first must understand how a number system
  with only ones and zeroes works.
---

# 8 - The Binary System

{% hint style="info" %}
This section is relevant for [Exercise 3: The Human Operator](https://github.com/winf-hsos/lifi-exercises/raw/main/exercises/03\_exercise\_human\_operator.pdf).
{% endhint %}

## Summary

In this section, you'll learn:

* The number system we use in our daily lives is the system to the base 10, or the _decimal system_ (_decimus_ is Latin for "tenth").
* The fact that we use the decimal system does not mean other systems do not exists. In fact, every other number system to other bases exists as well, and we can convert numbers between different systems.
* The word "decimal" or base ten implies that in that system, we have 10 symbols to represent numbers (0 - 9). Accordingly, the number system to the base 8, which is the _octal system_, has only eight symbols (0 - 7).
* Computers use the binary system (_bīnārius_ is Latin for "consisting of two"), which has only two symbols: 0 and 1.
* Regardless of how many symbols we have in a given system, representing numbers in a system follows the same approach. In a system to the base $$n$$, the first digit (also called least significant digit) represents the number $$n^0$$, which is always one. The second stands for $$n^1$$, the one after that for $$n^2$$ and so forth. So the octal number 10 is equal to the decimal number 8: $$1 \times 8^1 + 0 \times 8^0$$, and the octal number 110 would be the decimal number 72: $$1 \times 8^2 + 1 \times 8^1 + 0 \times 8^0$$&#x20;
* We can apply the same approach for the binary system. The binary number 1100 is equivalent to the decimal number 12: $$1 \times 2^3 + 1 \times 2^2 + 0 \times 2^1 + 0 \times 2^0 = 1 \times 8 + 1 \times 4 = 12$$&#x20;

## Material

### Slides

You can download a [PDF version of the slides](https://docs.google.com/presentation/d/1Zvvbp\_m\_OCb69UrZl93LKwoYpjcEscbq0ODOHIsp7A4/export/pdf):arrow\_down:.

{% embed url="https://docs.google.com/presentation/d/1Zvvbp_m_OCb69UrZl93LKwoYpjcEscbq0ODOHIsp7A4/preview" %}

### Videos

I have not yet produced a video for this topic myself. I can recommend the following videos from other authors:

* [Number Systems Introduction - Decimal, Binary, Octal, Hexadecimal (30:04)](https://www.youtube.com/watch?v=L2zsmYaI5ww)

### Texts

As additional read on the topic, please read the two excerpts below from \[1]. All texts are available through [OSCA](http://osca.hs-osnabrueck.de/):

* Chapter 7 - Our Ten Digits (8 pages)
* Chapter 8 - Alternatives to Ten (18 pages)

## References

\[1]  Petzold, Charles. _Code: The Hidden Language of Computer Hardware and Software_. Paperback ed, Microsoft Press, 2000.

\[2]  Scott, J. Clark. _But How Do It Know?: The Basic Principles of Computers for Everyone_. John C. Scott, 2009.
