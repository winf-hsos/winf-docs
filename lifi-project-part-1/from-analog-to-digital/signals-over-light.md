---
description: >-
  With LiFi, we aim to transmit data using light. For that, we need a way to
  detect light and transform the measurements into a discrete signal.
---

# Signals Over Light ⭐

<details>

<summary>Summary</summary>

This lesson is relevant for [Exercise 4: Digitizing the Physical World](https://github.com/winf-hsos/lifi-exercises/raw/main/exercises/04\_exercise\_digitizing\_the\_physical\_world.pdf).

</details>

## Digitizing Light

A color sensor is a device that can detect the color of an object by measuring the light that is reflected off it. When light enters the sensor, it is detected by a <mark style="background-color:yellow;">**photodiode**</mark>, which converts the light energy into an electric current.

The current generated by the photodiodes is then amplified and filtered to remove any unwanted noise or interference. The filtered signal is then split into its component colors - red, green, and blue - using filters that only allow specific ranges of light wavelengths to pass through. The resulting signals for each color are analog, which means they have a continuously varying voltage level over time.

To turn these analog signals into discrete values that a computer can understand, the color sensor uses an <mark style="background-color:yellow;">**analog-to-digital converter (ADC)**</mark> to convert each analog signal into a series of binary numbers. The ADC works by measuring the voltage of the analog signal at specific intervals, and converting these measurements into binary numbers. These binary numbers represent the intensity of each color, ranging from 0 (no intensity) to 255 (maximum intensity).

Finally, the color sensor combines these discrete values to produce the RGB values that describe the color of the object. RGB stands for red, green, and blue - the three primary colors of light - and the combination of these three values can create a wide range of colors.

## From Light to Signal

The goal of the LiFi project is to transmit data using light. Given that the color sensor returns the measured light values in RGB intensities, our task is to develop a <mark style="background-color:yellow;">**protocol**</mark> for data transmission based on these 3 intensity values. But how can we go about this?

### Binary Colors

As you learned earlier in [binary-numbers.md](../on-and-off/binary-numbers.md "mention"), computers use the binary system because it is straightforward to distinguish between two different states (on/off) using electric circuits. The same reasoning can be applied to encoding information using light.

When communicating with light, it may be easiest to distinguish just two colors from the sensor readings. This would allow us to use binary numbers to represent information. For example, we could assign a white light the value 1 and black the value 0.

To implement binary data transmission using light, the LED would be turned on and off at a defined interval, and the sensor would measure the intensity of the light at the same interval. By interpreting the sensor readings, we can determine whether the LED is emitting light or not, and hence decode the transmitted binary data. We must make sure that the sender and receiver are both aware of the chosen interval and change the LED and read the values at the same pace to ensure proper synchronization.

However, using light to transmit binary data comes with its challenges. For example, external factors such as ambient light and distance can affect the reliability of the transmitted data. Knowing this, we cannot expect the signal to be as clear as it would be under perfect circumstances: All RGB values 0 for an LED that is turned off, and all at highest intensity for an LED with white light. We have to factor in the environment and the ambient light present when we communicate over light. You'll have the chance to hands-on experience and solve this problem when you tackle the exercise "Color Detector" from [Exercise 4: Digitizing the Physical World](https://github.com/winf-hsos/lifi-exercises/raw/main/exercises/04\_exercise\_digitizing\_the\_physical\_world.pdf).

### Beyond Binary

In [#why-do-computers-think-binary](../on-and-off/binary-numbers.md#why-do-computers-think-binary "mention"), you learned that computers can use number systems other than binary to represent and process information. This means that computers don't just rely on the presence or absence of a voltage to perform their operations. Instead, using a number system larger than binary requires dividing the magnitude of the voltage into more than two classes, depending on how many symbols beyond 0 and 1 we want to represent. The same principle applies to light and has similar consequences.

Finding a solution for representing information with light might seem more straightforward than for electric current. Rather than relying on just two states of on and off (black/white), we could use the colors red, green, and blue as symbols to represent information using LEDs. This approach may seem less prone to errors, as colors are discrete values that cannot be misclassified. However, it's important to note that the color sensor does not actually see colors in this way. Instead, it measures the intensities of red, green, and blue and the task is to classify these intensities into the corresponding colors. Interference from other light sources can make this task more challenging and even impossible. Using even more symbols and adding colors such as yellow, which is a mix of green and blue, further increases the difficulty of the classification task.

<img src="../../.gitbook/assets/file.excalidraw (5).svg" alt="Using the LED&#x27;s colors for information representation looks easier than using voltage levels." class="gitbook-drawing">

## Further Reading

I highly recommend you read (and view, it's highly illustrative) the chapter "Digital Cameras" from the book "How Technology Works". The chapter gives a great visual overview of how light is measured and converted into a digital form.