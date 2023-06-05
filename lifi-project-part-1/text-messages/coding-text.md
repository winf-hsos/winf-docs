---
description: >-
  How can we receive a message of zeroes and ones that encodes ASCII text and
  translate them into a meaningful representation on our display?
---

# Coding Letters

<details>

<summary>Summary</summary>

In this lesson, you'll learn:

* ...
* ...

This lesson is relevant for [Exercise 6: Text Messages](https://winf-hsos.github.io/lifi-exercises/exercises/06\_exercise\_text\_messages.pdf).

</details>

## Designing a Code System

In the lesson about [measuring-information.md](../speed-of-light/measuring-information.md "mention"), we learned a way to figure out how many bits we need to save or send a message with a certain message space. This means the symbols we have and how long our message is. In this lesson, we want to develop a code system to communicate messages that contain the letters from A to Z as efficient as possible. When we speak of efficiency in this context, we mean a solution that requires the minimum number of bits and therefore signals over LiFi.

### How Many Bits?

Recall from the lesson [code-systems.md](../logic-with-the-led/code-systems.md "mention")that there already exists a code system that, among other characters, contains encodings for the letters A to Z: The ASCII code system. Why don't we simply use this code system? We certainly could, but it wouldn't satisfy our requirement to be as efficient as possible. The ASCII code uses 7 bits to encode a total of 128 characters, including uppercase and lowercase letters, numbers, punctuation and some invisible characters, such as line breaks. We don't need all that, all we need is the 26 capital letters from A to Z.

<img src="../../.gitbook/assets/file.excalidraw.svg" alt="The ASCII code system uses 7 bits to encode 128 characters. Too much for our LiFi-prototype." class="gitbook-drawing">

But how many bits do we need for that? We can calculate the answer using the formula we introduced earlier:

$$
B_{avg}=log_2(S)\times D
$$

In the formula above, $$S$$ is the number of symbols available, and $$D$$ the length of our message. We aren't concerned with the length of the message at this point. We want to calculate the number of bits we need to encode 26 letters. So:

$$
B_{avg}=log_2(26) \approx 4.7
$$

What does this mean? If we randomly choose a letter from A to Z and ask "Yes" or "No" questions such that we divide the symbol space in half with each question ("It is larger than N?"), we would need $$4.7$$ questions on average if we repeated this experiment many times. In some cases, it's 5 questions, and sometimes only 4. The average is useful to set a price for this kind of message, but not for designing a code system. For a code system, we need to make sure to reserve enough bits to encode all required symbols. We have to round up and pick the larger value of both, which is 5.

### Some Buffer

Five bits, that's the answer to the question: How many bits do we need to encode 26 capital letters? From the lesson [binary-numbers.md](../on-and-off/binary-numbers.md "mention"), we know that we can encode exactly 32 symbols with 5 bits because $$2^5 = 32$$. Applying our schema from back then, we can see that the largest decimal number we can represent with 5 bits is 31. Including 0, this makes 32 distinct numbers or codes we can assign meaning to.

<img src="../../.gitbook/assets/file.excalidraw (14).svg" alt="With 5 bits, we can represent the decimal numbers 0 through 31." class="gitbook-drawing">

