---
description: >-
  How can we create and transmit messages? And how much information does a
  message contain? Can we measure this?
---

# Measuring Information

<details>

<summary>Summary</summary>

In this lesson, you'll learn:

* That you can think of bits as answering questions with either "yes" or "no".
* How you can efficiently guess a random number (or any symbol from an ordered sequence) by dividing the search space in half with each guess.
* How you apply this concept to determine the number of bits required for a message with a given length and set of symbols.
* What formula you can use to determine the size of a message.

This lesson is relevant for [Exercise 5: Speed Of Light](https://winf-hsos.github.io/lifi-exercises/exercises/05\_exercise\_speed\_of\_light.pdf).

</details>

Start this lesson by watching the following video from a [computer science course on Information Theory hosted on Khan Academy](https://www.khanacademy.org/computing/computer-science/informationtheory/moderninfotheory/v/how-do-we-measure-information-language-of-coins-10-12).

{% embed url="https://youtu.be/PtmzfpV6CDE" %}

The important formula to take away from this video is the following, to calculate the number of bits needed to store a message:

$$
B_{avg}=log_2(S)\times D
$$

Where $$B_{avg}$$ is the average number of bits we need for a message, $$S$$ is the number of symbols available, and $$D$$ is the number of digits or the length of a message. However, the average number of bits required doesn't help us when we need to decide how  much storage to allocate. We should always make sure we can store any message, and not just the average-sized message. We can solve this by rounding the first part $$log_2(S)$$  to the next larger integer number.&#x20;

So, for example, a four digit PIN would require, on average $$log_2(10)\times 4$$ bits, which is $$\approx 3.233 \times4 \approx 13.288$$ bits. Since we agreed to round to the next larger integer number, we can calculate $$4\times 4 = 16$$ to be on the save side. When would this worst case happen?

Consider the PIN 8899. Storing a single 8 in binary would be 1000, and therefore require 4 bits to store. Since the 9 is even bigger than 8, it would also require four bits: 1001. Any PIN with only numbers below 8 could be stored with only 3 bits per digit, but we can't plan our system like that. A bank shouldn't, that's for sure!
