---
description: >-
  How can we transform a text message into a stream of zeroes and ones, send and
  receive it via LiFi, and then translate it back to letters from A to Z?
---

# Coding Letters

<details>

<summary>Summary</summary>

In this lesson, you'll learn:

* How you can design your own code system for a set of symbols.
* How to encode and decode a message using your new code system.

This lesson is relevant for [Exercise 6: Text Messages](https://winf-hsos.github.io/lifi-exercises/exercises/06\_exercise\_text\_messages.pdf).

</details>

## Designing a Code System

In the lesson about [measuring-information.md](../speed-of-light/measuring-information.md "mention"), we learned a way to figure out how many bits we need to save or send a message with a certain message space. This means the symbols we have and how long our message is. In this lesson, we want to develop a code system to communicate messages that contain the letters from A to Z as efficient as possible. When we speak of efficiency in this context, we mean a solution that requires the minimum number of bits and therefore signals over LiFi.

### How Many Bits?

Recall from the lesson [code-systems.md](../logic-with-the-led/code-systems.md "mention")that there already exists a code system that, among other characters, contains encodings for the letters A to Z: The [ASCII code system](../logic-with-the-led/code-systems.md#ascii-code). Why don't we simply use this code system? We certainly could, but it wouldn't satisfy our requirement to be as efficient as possible. The ASCII code uses 7 bits to encode a total of 128 characters, including uppercase and lowercase letters, numbers, punctuation and some invisible characters, such as line breaks. We don't need all that, all we need is the 26 capital letters from A to Z.

<img src="../../.gitbook/assets/file.excalidraw (1) (1).svg" alt="The ASCII code system uses 7 bits to encode 128 characters. Too much for our LiFi-prototype." class="gitbook-drawing">

But how many bits do we need for that? We can calculate the answer using the formula we introduced earlier:

$$
B_{avg}=log_2(S)\times D
$$

In the formula above, $$S$$ is the number of symbols available, and $$D$$ the length of our message. We aren't concerned with the length of the message at this point. We want to calculate the number of bits we need to encode 26 letters. So:

$$
B_{avg}=log_2(26) \approx 4.7
$$

What does this mean? If we randomly choose a letter from A to Z and ask "Yes" or "No" questions such that we divide the symbol space in half with each question ("It is larger than N?"), we would need $$4.7$$ questions on average if we repeated this experiment many times. In some cases, it's $$5$$ questions, and sometimes only $$4$$. The average is useful to set a price for this kind of message, but not for designing a code system. For a code system, we need to make sure to reserve enough bits to encode all required symbols. We have to round up and pick the larger value of both, which is $$5$$.

Note that the result $$4.7$$ from the formula above tells us the power to which we must take the $$2$$ to arrive at the 26 for the number of symbols:

$$
2^{4.7} \approx 26
$$

Since we need to choose full bits, and we must ensure we can encode all letters between A and Z, we have to choose the next higher whole number:

$$
2^{5} = 32
$$

### Some Buffer

Five bits, that's the answer to the question: How many bits do we require to encode 26 capital letters? From the lesson [binary-numbers.md](../on-and-off/binary-numbers.md "mention"), we know that we can encode exactly 32 symbols with 5 bits because $$2^5 = 32$$. Applying our schema from back then, we can see that the largest decimal number we can represent with 5 bits is 31. Including 0, this makes 32 distinct numbers or codes we can assign meaning to.

<img src="../../.gitbook/assets/file.excalidraw (14).svg" alt="With 5 bits, we can represent the decimal numbers 0 through 31." class="gitbook-drawing">

We only need 26 codes, which means we will have 6 unused codes in our code system. This can be useful if we need to extend our code system later on and add more symbols to it. Similar, the [Unicode Standard](https://en.wikipedia.org/wiki/Unicode) currently defines around 150,000 characters, which includes characters from all languages worldwide as well as emojis. The [UTF-8 encoding](https://en.wikipedia.org/wiki/UTF-8), a specific code system that implements the Unicode Standard, uses up to 4 bytes (or 32 bits) to represent characters. As you can quickly calculate, this leaves a vast amount of space for further symbols:

$$
2^{32} = 4,294,967,296
$$

This value is only theoretical, as the UTF-8 encoding is a variable-length code system and not all codes can be assigned a meaning. But nevertheless, there is lots of room to grow.

### Assigning Symbols to Codes

Now that we sized our code system, it's time to assign the symbols a code. While we could arbitrarily assign symbols to codes, for the letters A to Z it makes sense to assign codes in order. Our code system could look something like this:

<img src="../../.gitbook/assets/file.excalidraw (18).svg" alt="Our 5-bit code system for the uppercase letters A to Z." class="gitbook-drawing">

We did not yet assign symbols to the bits sequences `11010` (26) through `11111` (31). Theses are our buffer for symbols we might need in the future. Anticipating that we want to send messages that contain more than a single word, we could already assign the next code point to the space-character. A space indicates the start of a new word.

<img src="../../.gitbook/assets/file.excalidraw (11).svg" alt="Our extended 5-bit code system, including the SPACE character." class="gitbook-drawing">

## Encoding and Decoding

<mark style="background-color:yellow;">**Encoding**</mark> is the translation of the original text message into a sequence of bits according to the code system. <mark style="background-color:yellow;">**Decoding**</mark> is the opposite: Transforming the sequence of ones and zeroes back into letters (and spaces), knowing the code system that was used for encoding of the message.&#x20;

It is important to highlight that without the context of a code system, a sequence of bits has no meaning to us. Depending on the code system, a series of bits could represent letters from our above code system, but it could also stand for the colors of pixels in an RGB-encoded image or a sample from an audio file.

Given the code table of our code system and the fact that it is a fixed-length code system, encoding and decoding is straightforward. When encoding, we simply look up the binary code for each letter and add it to the binary representation of the whole message. When decoding, we look at chunks of 5 bits we received and look up the symbol that is assigned to this code. Let's step through this process with the word "LIFI".

When encoding the message in binary, we must step through each symbol and look up its binary code:

<img src="../../.gitbook/assets/file.excalidraw (1).svg" alt="Binary encoding of the message &#x22;LIFI&#x22; using the code table." class="gitbook-drawing">

Decoding a message works the other way around. We receive a stream of bits, e.g., using signals from the LED and the [three-color-protocol](../speed-of-light/very-light-messages.md#an-alternative-approach). To decode the original message, we need to know the encoding that was used to create the stream of bits. Knowing it, we split the bits into chunks of the size the code system uses and find the symbol for a chunk. In our case, the chunk size is 5 bits.

<img src="../../.gitbook/assets/file.excalidraw (16).svg" alt="Decoding the stream of bits using the same code system." class="gitbook-drawing">

We have successfully created our custom code system for uppercase letters. You are now ready to write a program to send and receive corresponding messages over LiFi. Give it a try!
