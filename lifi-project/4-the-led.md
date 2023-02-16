---
description: >-
  To start the project, we need an understanding of the different hardware
  parts. We start with the LED. Plus, we introduce some basic programming
  concepts.
---

# 4 - The LED

## Connecting to the LED

The connection to the LED is established through the Master Brick to which you connected the LED with a 7-pole wire in section [hardware-assembly.md](hardware-assembly.md "mention"). Take a look at the code below, which we'll explain in the following.

{% code lineNumbers="true" %}
```python
HOST = "localhost"
PORT = 4223
UID_LED = "xx" # Change to the UID of your RGB LED

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_rgb_led import BrickletRGBLED

ipcon = IPConnection()
ipcon.connect(HOST, PORT)
led = BrickletRGBLED(UID_LED, ipcon)
```
{% endcode %}

In summary, the code creates a new IP-connection (line 8) and connects using the host and port information (line 9) that we stored as <mark style="background-color:green;">**constants**</mark> (lines 1 & 2). In line 10, we create a new LED <mark style="background-color:green;">**object**</mark> by passing the device's <mark style="background-color:green;">**unique identifier (UID)**</mark> along with the IP-connection. Afterward, the <mark style="background-color:green;">**variable**</mark> `led` should hold a reference to our LED hardware device that is connected to our computer.

How can you find the UID of your LED? That's easy - we can use the Brick Viewer we installed previously in the section [development-environment.md](development-environment.md "mention"). Once connected, the UID shows up in the second column of the list of connected devices under the "Setup" tab. My RGB LED Bricklet has the UID "ATk".

<figure><img src="../.gitbook/assets/image (45).png" alt=""><figcaption><p>You can find the UID for every device in the Brick Viewer.</p></figcaption></figure>

## Random Numbers

```python
import random
r = random()
```

## Control Structures

```python
if r > 0.5:
    pass
elif:
    pass
```
