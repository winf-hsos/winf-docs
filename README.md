---
description: >-
  In this course, you learn the basics of digitalization and programming using
  the example of a research & development project.
---

# The LiFi-Project

<figure><img src=".gitbook/assets/LiFi Project Prototype (1).png" alt=""><figcaption><p>The LiFi Prototype</p></figcaption></figure>

## The project setup

[LiFi](https://en.wikipedia.org/wiki/Li-Fi) is a technology that allows for the transmission of information through the use of light. It uses the visible light spectrum to create a signal that can be received by a photodetector, which senses the light emitted by an LED. By varying the characteristics of the light over time, such as the wavelength or the brightness, we can encode and transmit data. LiFi has great potential for use in environments where radio frequency signals may interfere with microorganisms or other sensitive electronic devices. Moreover, in contrast to Bluetooth or WiFi, LiFi could be used in robots that operate underwater.

As part of an interdisciplinary R\&D team at a high-tech company that develops robots for food and agriculture applications, your task is to develop a LiFi communication device that can be integrated into the company's next generation of robots. The device comprises two main components: [a small LED](https://www.tinkerforge.com/en/doc/Hardware/Bricklets/RGB\_LED\_V2.html) that can light up in any of the roughly 16 million colors of the RGB coding system, and a [color sensor](https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Color\_V2.html) that can measure the intensity of the three RGB color channels as well as the brightness of the light. These components are controlled by a [Master Brick](https://www.tinkerforge.com/en/doc/Hardware/Bricks/Master\_Brick.html), which is responsible for ensuring smooth communication between the robot and its peripherals.

## An engineering problem

The LiFi-project is a typical engineering problem. It involves hardware and software, and the goal is  to combine both to solve a problem. The key question of this project is:

* **Can we transmit information using an LED and a color sensor?** (Spoiler alert: _Yes_)

If the answer is yes, then the following questions arise:

* **What is the best protocol for data transmission using an LED?**
* **How fast can we transmit information?**
* **How reliable is the data transfer?**
* **Over what distance can we transfer data?**
* **Under what environmental conditions does the setup work properly?**
* **How can we make our data transfer secure?**

We are faced with a significant limitation, as we are required to address these questions using the hardware provided to us, which consists of an LED, color sensor, rotary encoder with button functionality, and a 128 by 64 pixel OLED display.

By the end of this project, you will have solved the engineering problem and found answers to all of the above questions! And as a welcome side effect, you'll know a lot about the digital world and gain basic programming skills. Sounds good? Let's go!
