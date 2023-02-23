---
description: >-
  After the hardware is in one piece and the software is installed, let's run
  our first tests to see whether everything works properly.
---

# 3 - Smoke Tests

{% hint style="info" %}
This section is relevant for [Exercise 1: Hardware Assembly, Development Environment, and Smoke Test](https://github.com/winf-hsos/lifi-exercises/raw/main/exercises/01\_exercise\_hardware\_assembly.pdf).
{% endhint %}

## Summary

In this section, you'll learn:

* How you can test the hardware components required for the LiFi-project.
* What a smoke test is in (software) engineering and why it's important.
* What a program is and what our first program looks like.

## Code for this section

This section introduces a program for the smoke test, which we go through step-by-step. You can find [the program code on GitHub](https://github.com/winf-hsos/LiFi-code/blob/main/examples/smoke\_test.py), and I recommend you check out the entire [LiFi-code repository](https://github.com/winf-hsos/LiFi-code) with all examples in this course.

## What does a smoke test do?

The term <mark style="background-color:green;">**smoke test**</mark> in industrial engineering and software development describes the attempt to run a new system for the first time to see whether there are any major issues. The term 'smoke test' likely originated in the plumbing industry, where smoke was blown into a new pipe system to detect any leaks. For us, the smoke test means that we connect the hardware stack to a computer and test whether all components are working as expected. For this purpose, we can use the [Brick Viewer from Tinkerforge](https://www.tinkerforge.com/en/doc/Software/Brickv.html), which we installed in the [previous section](development-environment.md). Or we can use the Tinkerforge Python <mark style="background-color:green;">**API**</mark> and perform a smoke test from a program.

We'll perform two smoke tests in this section:

1. Connect to the hardware kit from the Tinkerforge Brick Viewer and test the device's most important functions.
2. Connect to the hardware kit from a Python program and test each device's individual functions as well as their interactions.

The tests give us confidence that all devices are intact, everything is wired correctly, all the identifiers were collected properly, and our development environment is installed and configured. If the test result is positive, that is.

## The UI-based smoke test

<mark style="background-color:orange;">TODO</mark>

## The program-based smoke test

The following code contains the full smoke test for our program-based version. It looks quite overwhelming for our first program, doesn't it? But don't worry: It looks shocking now, but by the end of this project, you can explain every single line. You can consider this a goal for this course.&#x20;

For now, we will only run the code to see how the components work and interact from a Python program. We will briefly try to understand parts of the code, but we are not shooting at the whole program (yet).

<details>

<summary>Full code for the program-based smoke test</summary>

{% code title="smoke_test.py" lineNumbers="true" %}
```python
import constants
import sys
from time import time, sleep

from colorama import just_fix_windows_console
from colorama import Fore, Back, Style
just_fix_windows_console()

from tinkerforge.ip_connection import IPConnection
from tinkerforge.brick_master import BrickMaster
from tinkerforge.bricklet_rgb_led import BrickletRGBLED
from tinkerforge.bricklet_rotary_encoder_v2 import BrickletRotaryEncoderV2
from tinkerforge.bricklet_color_v2 import BrickletColorV2
from tinkerforge.bricklet_oled_128x64 import BrickletOLED128x64

ipcon = IPConnection() # Create IP connection
ipcon.connect(constants.HOST, constants.PORT) # Connect to brickd

# Create device instances
led = BrickletRGBLED(constants.UID_RGB_LED, ipcon)
rotary = BrickletRotaryEncoderV2(constants.UID_ROTARY_ENCODER, ipcon)
oled = BrickletOLED128x64(constants.UID_OLED_DISPLAY, ipcon)
color = BrickletColorV2(constants.UID_COLOR_SENSOR, ipcon)

def update_oled_with_rgb_color(r, g, b):
    # Write current RGB LED's color to the OLED display
    oled.write_line(0, 0, "RGD LED Color:".ljust(26))
    oled.write_line(1, 0, f"R = {r}, G = {g}, B = {b}".ljust(26))

def update_oled_with_color_measurement(measured_r, measured_g, measured_b):
    oled.write_line(3, 0, "Color Sensor:".ljust(26))
    max_color_intensity = 65535
    oled.write_line(4, 0, f"R = {measured_r / max_color_intensity * 255:.0f}, G = {measured_g / max_color_intensity * 255:.0f}, B = {measured_b / max_color_intensity * 255:.0f}".ljust(26))

# Get the current color value of the RGB LED Bricklet
current_rgb_colors = led.get_rgb_value()
update_oled_with_rgb_color(current_rgb_colors.r, current_rgb_colors.g, current_rgb_colors.b)

# Get and reset the current count for the Rotary Encoder Bricklet
rotary.reset()
current_rotary_count = rotary.get_count(reset=False)

# Remember which color is currently controlled by the Rotary Encoder Bricklet (0 = "red", 1 = "green", 2 = "blue")
current_controlled_rgb_color_index = 0

# Set a callback function for the Rotary Encoder Bricklet
def rotary_changed_callback(count):
    if count == 0:
        return
    
    # Get the current color from the RGB LED
    current_rgb = led.get_rgb_value()
    current_rgb_list = [current_rgb.r, current_rgb.g, current_rgb.b]

    # Calculate the new RGB color from the Rotary Encoder's count
    global current_controlled_rgb_color_index
    current_rgb_list[current_controlled_rgb_color_index] += count

    if current_rgb_list[current_controlled_rgb_color_index]  > 255:
        current_rgb_list[current_controlled_rgb_color_index] = 255
    elif current_rgb_list[current_controlled_rgb_color_index] < 0:
        current_rgb_list[current_controlled_rgb_color_index] = 0

    led.set_rgb_value(current_rgb_list[0], current_rgb_list[1], current_rgb_list[2])
    update_oled_with_rgb_color(current_rgb_list[0], current_rgb_list[1], current_rgb_list[2])

    rotary.get_count(True)

def rotary_pressed():
    global current_controlled_rgb_color_index
    time_pressed = time()
    
    while rotary.is_pressed():
        sleep(0.01)
    
        duration_pressed = time() - time_pressed
        if duration_pressed >= 2:
            led.set_rgb_value(0, 0, 0)
            update_oled_with_rgb_color(0, 0, 0)
            return

    current_controlled_rgb_color_index += 1
    if current_controlled_rgb_color_index > 2:
        current_controlled_rgb_color_index = 0

def rotary_released():
    pass   

rotary.register_callback(BrickletRotaryEncoderV2.CALLBACK_COUNT, rotary_changed_callback)
rotary.set_count_callback_configuration(10, True, "x", 0, 0)

rotary.register_callback(BrickletRotaryEncoderV2.CALLBACK_PRESSED, rotary_pressed)
rotary.register_callback(BrickletRotaryEncoderV2.CALLBACK_RELEASED, rotary_released)

# Set up callback functions for the Color Bricklet
def color_changed(r, g, b, c):
    update_oled_with_color_measurement(r, g, b)

# Turn the status LED off to avoid inteference
color.set_status_led_config(0)

color.register_callback(BrickletColorV2.CALLBACK_COLOR, color_changed)
color.set_color_callback_configuration(20, False)

input("Please hit enter to exit")

# Disconnect from Brick Daemon
ipcon.disconnect()
```
{% endcode %}

</details>

Running this code is a task during [your first exercise](https://github.com/winf-hsos/lifi-exercises/raw/main/exercises/01\_exercise\_hardware\_assembly.pdf). In the following, we examine parts of the code a bit closer and introduce our first concepts in programming. Don't worry, we will learn about each concept in more detail later on. This is just to give you a rough overview of how the smoke test program works.

## What is a program?

### Instructions

A program is a set of instructions for a computer to execute. A program is written as plain text, and all we need is a basic text editor, although we prefer a complete [development-environment.md](development-environment.md "mention").&#x20;

When a computer executes a program, it steps through the program from top to bottom and executes the instructions line-by-line. Most of the time, that is. Some constructs such as <mark style="background-color:green;">**loops**</mark>, <mark style="background-color:green;">**control structures**</mark>, and <mark style="background-color:green;">**functions**</mark>, which you'll learn about soon, make the computer deviate from this linear execution of the program.

We said that a program contains instructions, which is another word for telling the computer what to do. In programming, there are different types of instructions, and each is useful to solve problems. In a program, we use instructions to tell a computer to:

* Remember things.
* Calculate things.
* Do things over and over again.
* Do one thing or the other, depending on the outcome of a decision.
* Recycle things we taught it how to do, so we don't have to repeat ourselves.

### Five types of instructions in programming

The above list of things a computer can do translate into five general types of instructions in programming that you will need to understand and master throughout the LiFi-project:

1. <mark style="background-color:green;">**Variables**</mark> (_remember things_)
2. <mark style="background-color:green;">**Expressions**</mark> (_calculate things_)
3. <mark style="background-color:green;">**Loops**</mark> (_do things over and over_)
4. <mark style="background-color:green;">**Control structures**</mark> (_do one thing or the other_)
5. <mark style="background-color:green;">**Functions**</mark> (_recycle things we taught it_)

The great news is: Once you understand the concept behind each of them, you can read and write almost any program, no matter the complexity. These concepts are the DNA of every program. Of course, it takes practice. And you may still have to look up specific keywords for the language you are programming in. But that's where [Google](https://app.gitbook.com/u/5a55d1d8d10859002f1ae2f5), [Stackoverflow](https://stackoverflow.com/) or [ChatGPT](https://chat.openai.com/chat) come in. Seriously, they are every programmer's best buddies. Learn to use them.

#### 1. Variables

Think of a variable as a container with a label on it. You can put things into the container and at any time you can ask for the content of the container, given you know the container's label. You can change the content of the container as you like at any time.

In a program, a variable is actually a pointer to an address in the computer's main memory. By calling the variable by its name, you are taken to this particular location in the computer's memory, and you can access whatever has been stored there. You can also overwrite the memory location with a value of your choice. A memory address is simply a number that identifies a specific location in memory. Variables exist, so we can store and access things in memory from within our program.&#x20;

We define a variable in Python by writing the desired name and assigning a value using the `=` symbol:

```python
last_name = "Meseth"
first_name = "Nicolas"Pyth
age = 41
```

We are more or less free in choosing a variable's name. There are only few rules and some conventions:

* Variable names should start with a small letter (_convention_).&#x20;
* Variables names cannot start with a number (_rule_).
* Variable names cannot contain any special characters, except the underscore "`_`" (_rule_).
* Variable names should be speaking so that we can infer what the variable's original intentional use was (_convention_).
* When a variable name is composed of more than one word, we use an underscore to connect the two (or more) words (as in `last_name`). An alternative would be so-called camel-casing, where the two words are not separated, but a new word starts with a capital letter (e.g., `lastName`). Camel-casing is not conventional in Python.

#### 2. Expressions

#### 3. Loops

#### 4. Control structures

#### 5. Functions
