---
description: >-
  The OLED display is a simple output device that we can use to interface with a
  human and to inform him of important events.
---

# The OLED Display ⚡

<details>

<summary>Summary</summary>

In this lesson, you'll learn:

* How to connect to the OLED display.
* How to clear the display and remove all its contents.
* How to write letters and numbers at a specific position on the display.
* How to clear a specific line of text.

You find the code examples in the [LiFi-code GitHub repository](https://github.com/winf-hsos/LiFi-code) in [`devices/oled_display.py`](https://github.com/winf-hsos/LiFi-code/blob/main/devices/oled\_display.py).

This lesson is relevant for [Exercise 5: Speed Of Light](https://winf-hsos.github.io/lifi-exercises/exercises/05\_exercise\_speed\_of\_light.pdf).

</details>

We are planning to incorporate the LiFi prototype into a robot, which will then not be connected to your computer. As a result, we won't have a computer monitor or laptop screen to show information to the user. However, it would be helpful if the robots could communicate with humans in some way. The company does not intend to create robots that can speak, so the robots will employ a small OLED display to share information.

![](<../../.gitbook/assets/image (46).png>)

This OLED display can display a 128 by 64 pixel matrix, and when writing text or numbers, we can use a total of 8 lines, with each line containing up to 26 characters.

## Getting a Reference to the Display

Like for all other devices we introduced before, Tinkerforge provides an object for the OLED display that we must first import and then utilize to create a reference and store it on a variable:

```python
# Import the OLED object from the Tinkerforge API
from tinkerforge.bricklet_oled_128x64_v2 import BrickletOLED128x64V2

# ... do other stuff, create the IP connection etc.

# Create a reference and store it on the variable "oled"
oled = BrickletOLED128x64V2(UID_OLED_DISPLAY, ipcon)
```

## Clearing the Display

We can clear the whole display with one line of code:

```python
oled.clear_display()
```

## Writing Letters and Numbers

We can use `write_line` and write a sequence of text to the position given by the first two parameters. Note that we start enumerating the rows and columns at 0. So this writes "Welcome!" to the top left of the display:

```python
oled.write_line(0, 0, "Welcome!")
```

Similarly, this writes text to the bottom left:

```python
oled.write_line(7, 0, "COPYRIGHT 2023")
```

## Clearing a Specific Line

There is no function provided by the Tinkerforge API for clearing a specific line. Nonetheless, this is sometimes very useful. We can apply a little trick and fill a whole line with spaces. Instead of writing an actual character sequence with 26 spaces in it, we use a shortcut:

```python
oled.write_line(0, 0, " " * 26)
```

The expression `" " * 26` creates a string with 26 spaces by multiplying one space with the number 26.
