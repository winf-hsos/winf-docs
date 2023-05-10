---
description: >-
  We learned how a computer represents text with the ASCII code. But what about
  processing text? Let's convert a message to lowercase and learn the basics of
  information processing along the way.
---

# Logic and Arithmetic

<details>

<summary>Summary</summary>

In this lesson, you'll learn:

* How you can use simple addition to convert ASCII letters to lowercase.
* That computers use small devices called logic gates in large quantity to perform all information processing.
* How logic gates can be built from even smaller things.
* How binary addition is possible with only logic gates.

This lesson is relevant for [Exercise 6: Text Messages](https://docs.google.com/viewer?url=https://raw.githubusercontent.com/winf-hsos/lifi-exercises/master/exercises/06\_exercise\_text\_messages.pdf).

</details>

## ASCII Lowercase Conversion

In ASCII, uppercase letters and lowercase letters have different numerical codes. The ASCII codes for uppercase letters are in the range 65 to 90, and the ASCII codes for lowercase letters are in the range 97 to 122.&#x20;

To convert an uppercase letter to lowercase in ASCII, you can add 32 to its ASCII code. This is because the difference between the ASCII codes of the lowercase and uppercase letters is always 32.&#x20;

For example, the ASCII code for the uppercase letter "A" is 65, and the ASCII code for the lowercase letter "a" is 97, which is 32 more than 65. Similarly, the ASCII code for the uppercase letter "Z" is 90, and the ASCII code for the lowercase letter "z" is 122, which is also 32 more than 90.

<img src="../../.gitbook/assets/file.excalidraw (15).svg" alt="We can add 32 to the ASCII code of a capital letter to convert it to lowercase." class="gitbook-drawing">

To convert a given string into lowercase letters using a custom `to_lower` function in Python, the function needs to perform the following steps:

1. The function takes a string argument and iterates through each character in the string.
2. For each character, the function checks whether it is an uppercase letter by comparing its ASCII code to the range between 65 and 90, which are the ASCII codes for uppercase letters. We can get the ASCII code of a character using the `ord()` function.
3. If the character is an uppercase letter, the function adds 32 to its ASCII code, which effectively converts it to the corresponding lowercase letter. Then, it converts the new ASCII code back to a character using the `chr()` function and adds it to a result string variable.
4. If the character is not an uppercase letter, the function simply adds the character to the result variable without modification.
5. After all characters have been processed, the function returns the result variable containing the converted string.

I encourage you to try this as an exercise to strengthen your programming skills. You find a solution to this problem in the [LiFi code GitHub-Repository](https://github.com/winf-hsos/LiFi-code/blob/main/problem\_solutions/to\_lower.py).

## Logic Gates

<img src="../../.gitbook/assets/file.excalidraw (6).svg" alt="The four basic logic gates." class="gitbook-drawing">

<img src="../../.gitbook/assets/file.excalidraw.svg" alt="The AND- and OR-gate combined with the NOT-gate result in NAND and NOR-gates." class="gitbook-drawing">

## Binary Addition

## Further Reading

I recommend the great book _Code: The Hidden Language of Computer Hardware and Software_ by Charles Petzold to learn more about how computers process information. He covers logic gates and binary addition in the following chapters, which I provide to all students taking my course at the University of Applied Sciences in Osnabrück:

* Chapter 8 "Relays and Gates"
* Chapter 14 "Adding with Logic Gates"

