---
description: >-
  In this section, we'll learn how an analog signal can be digitized to be
  processed by a digital computer.
---

# Digitization

<details>

<summary>Summary</summary>

In this lesson, you'll learn:

* The difference between the analog and digital world.
* How we can transform sound and images from an analog to a digital format.
* What the terms sampling and quantization mean in the context of digitization.
* The  benefits of digital goods over analog or physical ones.
* The difference between digitization and digitalization

This lesson is relevant for [Exercise 4: Digitizing The Physical World](https://winf-hsos.github.io/lifi-exercises/exercises/04\_exercise\_digitizing\_the\_physical\_world.pdf).

</details>

## The Analog vs. Digital World

The analog world represents <mark style="background-color:yellow;">**continuous signals**</mark>, while the digital world consists of <mark style="background-color:yellow;">**discrete signals**</mark>. To illustrate this concept, imagine stairs with discrete steps versus an inclined plane with continuous levels where one can stand. The stairs represent the digital world, with each step being a distinct level, while the inclined plane symbolizes the analog world, where any position along the slope can be occupied.

<img src="../../.gitbook/assets/file.excalidraw (2) (1) (1).svg" alt="The difference between analog and digital: Which is which?" class="gitbook-drawing">

## Digitization

<mark style="background-color:yellow;">**Digitization**</mark> is the process of converting information from the analog world into a digital format. Examples of this process include transforming sound into digital audio files or images into digital pictures. This transformation involves converting continuous signals into discrete data, which can be easily stored, processed, and shared.

### Digitizing Sound

Let's take sound waves as an example. To understand the digitization of sound waves, it is important to first understand the nature of sound and how it travels. Sound is a form of mechanical wave produced by vibrations that propagate through a medium (such as air, water, or solid materials). These vibrations create pressure fluctuations, resulting in compressions and expansions in the medium. When these pressure changes reach our ears, they are detected by the eardrum, which then sends signals to the brain to be processed as sound.

The digitization of sound involves converting these continuous analog sound waves into a digital representation that can be easily stored, manipulated, and transmitted using computers or other digital devices. The process consists of two main steps: <mark style="background-color:yellow;">**sampling**</mark> and <mark style="background-color:yellow;">**quantization**</mark>.

<img src="../../.gitbook/assets/file.excalidraw (12).svg" alt="" class="gitbook-drawing">

Sampling is the process of taking periodic snapshots or measurements of an analog sound wave's pressure or amplitude at regular intervals. These intervals are determined by the sampling rate (also known as sample frequency), which is the number of samples taken per second. The higher the sampling rate, the more accurate the digital representation of the sound wave will be.

<img src="../../.gitbook/assets/file.excalidraw (7).svg" alt="The idea of sampling a sound wave visually explained, highlighting the loss of information when digitizing an analog signal." class="gitbook-drawing">

According to the [Nyquist-Shannon sampling theorem](https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon\_sampling\_theorem), the sampling rate should be at least twice the highest frequency present in the sound wave to avoid <mark style="background-color:yellow;">**aliasing**</mark>, which can cause distortion in the digitized sound. For example, the standard sampling rate for CD-quality audio is 44.1 kHz, which means that 44,100 samples are taken per second, enabling the accurate representation of frequencies up to 22.05 kHz (approximately the upper limit of human hearing).

Once the sound wave has been sampled, the next step is quantization. Quantization is the process of assigning a discrete digital value to each sample taken from the continuous analog sound wave. This is accomplished by dividing the range of possible amplitude values into a finite number of levels or steps.

The number of levels is determined by the bit depth, which is the number of bits used to represent each sample. A higher bit depth results in more available levels and increased accuracy in the digital representation of the sound wave's amplitude. For example, a 16-bit system has$$2^{16} = 65,536$$ possible amplitude levels.

During the quantization process, the sampled amplitude values are rounded or approximated to the nearest available level. This introduces quantization error, also known as quantization noise, which can lead to a loss of detail or fidelity in the digitized sound. However, higher bit depths help minimize this error, producing a more accurate digital representation of the analog sound wave.

Once the sound wave has been sampled and quantized, it is converted into a stream of binary data (0s and 1s) that can be stored, manipulated, and transmitted using digital devices. To play back the digitized sound, the binary data is converted back into an analog signal using a digital-to-analog converter (DAC), which drives a speaker or headphones to reproduce the original sound wave.

### Digitizing Images

Digitization of images involves converting continuous analog images, such as photographs or paintings, into a digital representation that can be easily stored, manipulated, and transmitted using computers or other digital devices. Just like in the sound wave example above, the process consists of sampling and quantization.

<img src="../../.gitbook/assets/file.excalidraw (2) (1) (2).svg" alt="When sampling an image, we divide it into a grid of pixels of the same size." class="gitbook-drawing">

Sampling in the context of image digitization refers to dividing the continuous analog image into a grid of discrete points or <mark style="background-color:yellow;">**pixels**</mark> (short for "picture elements"). Each pixel represents a small area of the original image and captures its color and brightness information. The resolution of the digital image, measured in <mark style="background-color:yellow;">**pixels per inch (PPI)**</mark> or <mark style="background-color:yellow;">**dots per inch (DPI)**</mark>, determines the number of pixels used to represent the image and directly impacts the level of detail and quality of the digital representation. A higher resolution results in a more accurate representation of the original image.

Once the image has been divided into a grid of pixels, the next step is again quantization. Here, quantization is the process of assigning a discrete digital value to each pixel, representing the color and brightness information of the corresponding area in the original image. In color images, this information is typically stored as a combination of red, green, and blue components using the <mark style="background-color:yellow;">**RGB code**</mark> we introduced [before](../logic-with-the-led/code-systems.md).

<img src="../../.gitbook/assets/file.excalidraw (9).svg" alt="Quantization means finding a value to represent the color and brightness for each pixel." class="gitbook-drawing">

The number of distinct colors or brightness levels that can be represented is determined by the bit depth, which is the number of bits used to represent each pixel's color or brightness information. A higher bit depth results in a greater number of available colors or brightness levels, leading to a more accurate and detailed digital representation of the image. For example, an 8-bit image can represent $$2^8 = 256$$ distinct levels for each color channel, while a 24-bit image can represent over 16 million or $$2^{24 }$$ distinct colors.

During the quantization process, the color and brightness values are rounded or approximated to the nearest available level, which introduces quantization error, also known as quantization noise. This can lead to a loss of detail or fidelity in the digitized image. However, higher bit depths help minimize this error, producing a more accurate digital representation of the analog image.

Just as with the sound example, once the image has been sampled and quantized, it is converted into a stream of binary data (0s and 1s) that can be stored, manipulated, and transmitted using digital devices. To display the digitized image, the binary data is converted back into an array of colored pixels, which are rendered on a screen or printed on paper.

### Better Quality = More Data

The quality of digital sound and image files is closely related to factors such as sample rate, bit depth, pixels per inch, and color depth. In audio, a higher sample rate captures a broader range of frequencies, while a greater bit depth results in a wider dynamic range and reduced quantization noise. In images, a higher pixel density (pixels per inch) captures finer details, and an increased color depth allows for more distinct colors and smoother gradients.&#x20;

However, improving these features also increases the size of the digital representation, as more bits and bytes are required to store the additional information. This means that higher-quality digital files will demand more storage space and potentially longer processing and transmission times.

## Benefits

The digital version of things such as sound and images offers numerous benefits over their analog forms. One key advantage is that digitized data can be <mark style="background-color:yellow;">**easily processed, manipulated, and analyzed by computers**</mark>, enabling innovations in fields such as audio engineering, image editing, and artificial intelligence. Digital files also allow for <mark style="background-color:yellow;">**perfect reproduction**</mark>, ensuring that the quality of the content remains intact, regardless of the number of times it is copied or transmitted. This contrasts with analog formats, which are susceptible to degradation with each copy or playback. Furthermore, digitization enables <mark style="background-color:yellow;">**near-zero cost reproduction**</mark> and the creation of <mark style="background-color:yellow;">**infinite copies**</mark>, making digital content more accessible and easily distributable. In economic terms, we say that digital goods are <mark style="background-color:yellow;">**non-rival**</mark>. If one customer buys a digital music album, this doesn't mean that another customer can't.

<img src="../../.gitbook/assets/file.excalidraw (3) (3) (1).svg" alt="For a digital good, there are no variable costs to produce the next unit." class="gitbook-drawing">

## Digitization and Digitalization

The terms "<mark style="background-color:yellow;">**digitization**</mark>" and "<mark style="background-color:yellow;">**digitalization**</mark>" are often used interchangeably, but they have distinct meanings. Digitization refers to the process of converting analog information, such as sound or images, into a digital format that can be easily stored, manipulated, and transmitted using computers or digital devices. Examples of digitization include scanning a photograph or recording an analog sound wave as a digital audio file. On the other hand, digitalization is the broader transformation of business processes, organizational culture, and entire industries through the adoption and integration of digital technologies. This typically involves rethinking and redesigning workflows, communication channels, and customer experiences to leverage the capabilities of digital tools. For instance, digitalization can include implementing a paperless office, using cloud-based services, or adopting data-driven decision-making strategies.

In German, the distinction between these two concepts is not as clear, as both are often referred to using the same word, "Digitalisierung." However, the term "Digitale Transformation" is frequently used to emphasize the broader meaning of digitalization and its impact on businesses and society. This highlights the importance of understanding the nuances between digitization as a specific conversion process and digitalization as a more comprehensive shift towards embracing the digital era.
