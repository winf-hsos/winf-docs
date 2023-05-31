---
description: >-
  How can we create a simple message and encode it, so we can transmit it using
  nothing but an LED?
---

# Very Light Messages ⭐

<details>

<summary>Summary</summary>

In this lesson, you'll learn:

* Why it can be difficult to synchronize the sender (LED) and the receiver (color sensor) when communicating over light.
* How a different approach could look like that doesn't rely on time synchronization.

This lesson is relevant for [Exercise 5: Speed Of Light](https://winf-hsos.github.io/lifi-exercises/exercises/05\_exercise\_speed\_of\_light.pdf).

</details>

## The Synchronization Problem

In the lesson [signals-over-light.md](../from-analog-to-digital/signals-over-light.md "mention"), you learned that we can use three colors of the LED to represent three distinct symbols, enabling us to encode our messages using the ternary system with a base of three. To achieve this, it's essential that the sender robot using the LED and the receiver using the color sensor synchronize and agree on a specific time interval for transmitting and receiving signals.&#x20;

Although it's straightforward to identify a common interval (by programming the robots to use the same interval), getting two independent robots to concur on a start time for transmitting and receiving presents an additional challenge. This challenge, however, can be overcome, and you can attempt to solve it as an exercise.

## An Alternative Approach

What if we could design a communication protocol that does not rely on synchronization of the two robots? The figure below illustrates a protocol that is also based on the three colors red, green, and blue. But instead of encoding ternary numbers, it sacrifices one symbol and can only communicate in binary. In exchange, we eliminate the need for synchronization.

In the diagram, each colored circle represents the current state of the LED, which can be either red, green, or blue. The arrows between the circles indicate a change of state from one color to another, and each transition corresponds to a specific bit value of either 0 or 1. With three colors in total, we can select between two colors based on the current state. One of these colors denotes the binary value of 1, while the other color represents 0.



<img src="../../.gitbook/assets/file.excalidraw (17) (1).svg" alt="A protocol based on three states to encode bits." class="gitbook-drawing">

We can represent this protocol as a transition table, which can be used to decode the bit that's been transmitted. To do so, you locate the color that the LED was previously in along the table's rows and then identify the color that it has moved to along the columns. The value in the cell where the row and column intersect denotes the bit that's been encoded through this transition.

<img src="../../.gitbook/assets/file.excalidraw (10).svg" alt="The protocol as a transition table between states." class="gitbook-drawing">

With this protocol, the timing of when the color sensor of the receiving robot reads the next value is irrelevant. The color sensor can continuously detect the color, and as long as it stays the same, no bit has been received. Only when the color sensor detects a color that's different from the previous one, it decodes the corresponding bit using the protocol and adds it to the overall message.

## The Start of the Message

Wait - how do we know when a robot starts sending a message? While we have eliminated the need for synchronization during the message transmission process, we still need to address the issue of how the receiving robot knows when the sending robot has started transmitting a message. When two robots meet, the sending robot needs to somehow signal to the receiving robot that it has begun transmitting the message. Without this signal, the receiving robot won't know when the message has started, and it may miss some of the transmitted bits.

There are different ways to address this problem, but for the LiFi prototype, we propose using a fourth color, yellow. When two robots face each other, their LEDs are turned off by default. However, the color sensors of all robots continuously scan for light signals. As long as the LEDs are off, the sensors won't detect anything except for ambient noise.

To signal that it's about to start transmitting a message, the sending robot can turn its LED yellow. After this signal, it can only switch the LED to red; all other colors are invalid. This serves as a safety mechanism, and the receiving robot will discard any signals that don't follow this protocol. The yellow signal will be an indicator of a new message, and the receiving robot can start decoding the transmitted bits.

<img src="../../.gitbook/assets/file.excalidraw (14).svg" alt="" class="gitbook-drawing">

With the addition of the fourth color, any robot that arrives at a conversation late can simply wait for the LED to turn yellow and know that a new message is about to be transmitted. Similarly, if a robot misses a bit due to a sensor failure or an unexpected event, it can wait for the sender to start transmitting again. The yellow light will serve as an indicator for when the next message transmission will start. At the same time, it also indicated the end of a message.&#x20;

In this scenario, it would make sense that the sender repeats sending the same message until it receives a confirmation that the message was received. See if you can solve this on your own!

