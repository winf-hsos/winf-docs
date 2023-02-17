# 5 - Code Systems

{% hint style="info" %}
This section is relevant for [Exercise 2: Logic with the LED](https://github.com/winf-hsos/lifi-exercises/raw/main/exercises/02\_exercise\_logic\_with\_the\_led.pdf).
{% endhint %}

## Summary

In this section, you'll learn:

* How colors can be specified using a code system called the <mark style="background-color:green;">**RGB code.**</mark>
* Why the RGB code can represent 16,777,216 colors.
* What a code system is and what it is made of.

## The RGB code

In the previous section about [the-led.md](the-led.md "mention"), we briefly touched the RGB code and used it to set the LED's color to green. We did this using a function provided by the Tinkerforge <mark style="background-color:green;">**API**</mark> called `set_rgb_value`. When calling this function, we passed three numbers to it:

```python
led.set_rgb_value(0, 255, 0)
```

### The RGB code in a nutshell

It is now time to understand what these three numbers mean and what values we can assign to each of them. The short answer is: the numbers belong to the RGB code, which is a code system that uses 3 <mark style="background-color:green;">**bytes**</mark> to represent one of roughly 16 million colors. The abbreviation RGB stands for the three colors **r**ed, **g**reen, and **b**lue. The RGB code specifies the intensity for each of these three basic colors to create the desired resulting color. The RGB code reserves one byte for each of the three basic colors, hence 3 bytes in total. Knowing that, we understand why the above code line produces a pure green color. All basic colors are set to zero, except green, which is set to 255, the largest possible number we can store in one byte.

That was a lot! Let's unpack this.

### Why \~16 million colors?

With the RGB code, we can represent exactly 16,777,216 different colors. That's what I meant above by saying "roughly 16 million". The reason is simple mathematics: A color in the RGB code is defined by a mix of the three basic color red, green, and blue. For each basic color, we can specify an intensity between 0 (none of that color) and 255 (full intensity). This makes 256 possible values for one basic color. Because we can combine all possible values of the three basic colors, and each results in a different color, the RGB code can represent

$$
256 \times 256 \times 256 = 16,777,216
$$

different colors. But why is it that for each basic color, we can specify the intensity between 0 and the seemingly arbitrary upper limit of 255? The answer lies is the byte.

### What is a byte and why 255?

Simply put, a byte is a sequence of eight digits that can be either 0 or 1. A digit that can either be 0 or 1 is called a <mark style="background-color:green;">**bit**</mark>, which is short for <mark style="background-color:green;">**binary digit**</mark>. So eight bits equal one byte.

So, what about the 255? Well, that is the largest <mark style="background-color:green;">**decimal number**</mark> we can represent with one byte (or 8 bits). We'll discuss the [the-binary-system.md](the-binary-system.md "mention") in more detail later on, but here is the quick explanation: If we only had one bit, how many numbers could we represent with it? That's simple, only two: 0 and 1. But what if we had two bits? How many numbers can we represent then? We can figure this out by calculating the number of combinations we can create from two digits with two possible values: $$2 \times 2 = 4$$. What if we had three bits? Well: $$2 \times 2 \times 2 = 8$$. In general, for $$n$$ bits, we can calculate the number of combinations as $$2^n$$. Thus, the answer for eight bits (or one byte) is $$2^8 = 256$$. That means, we can represent numbers between 0 and 255, which makes 256 different values. And since the RGB code uses one byte for each of the three basic colors, the intensity can be a number between 0 and 255.

### What does the weird hashtag as in #00FF00 mean?

Occasionally, you see colors being specified in a format that starts with a hashtag symbol followed by 6 numbers or letters. This is the RGB code expressed as a <mark style="background-color:green;">**hexadecimal number**</mark>. The <mark style="background-color:green;">**hexadecimal system**</mark> is often used to express the value of a byte because in this system we can write one byte with only two symbols. This makes it very compact.&#x20;

The color "#00FF00" corresponds to full green: the first two "00" digits represent the first byte, which in the RGB code stands for the intensity of red, which is zero here. The next two digits "FF" stand for the intensity of green, and "FF" is the largest possible value for a two-digit hexadecimal number. "FF" is 255 in decimal. The last pair "00" is for the intensity of blue, which is also zero.

You will learn more about the hexadecimal system when we introduce [the-binary-system.md](the-binary-system.md "mention") alongside the general idea of <mark style="background-color:green;">**number systems**</mark>.

## Code systems

You have just learned that the RGB code uses a total of $$2^{24}=16,777,216$$ numbers and assigns to each a specific color. All other code systems work the same way. We have a code, which for computers is always a number, and we assign a meaning to this code. The two questions we need to ask are:

* How many codes do I need? That is, how many things do I need to represent with that code? In RGB code, that is 16,777,216 colors that need to be encoded.
* How many bits do we need to represent the number of different codes? In RGB code, that is 24 bits or 3 bytes.

### ASCII Code

<mark style="background-color:yellow;">TODO</mark>
