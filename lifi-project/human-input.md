---
description: >-
  Humans must be able to interact with a digital solution to use it, be it hard-
  or software. In this section, we'll explore some options for human input for
  both.
---

# 9 - Human Input

## The Rotary Encoder

The rotary encoder is a typical control for human input in many hardware devices. The user can turn the knob in both directions, which changes a value represented by the control. Turning it right increases the value, while turning it left decreases it. In addition, the rotary encoder has the functionality of a button. When the user presses the knob, this fires an <mark style="background-color:green;">**event**</mark>, and we can perform some action based on that event.

<img src="../.gitbook/assets/image (1) (2).png" alt="" data-size="original">

### Initialize the rotary encoder

As with all devices, we first need to establish a connection and store a reference to the device on a variable. We can do this with the following lines. I assume you have already created the IP-connection and executed `connect()`:

{% code lineNumbers="true" %}
```python
from tinkerforge.bricklet_rotary_encoder_v2 import BrickletRotaryEncoderV2
rotary = BrickletRotaryEncoderV2("xxx", ipcon)
```
{% endcode %}

Make sure you replace the UID with [your device's UID](the-led.md#how-to-get-a-devices-uid) before you go any further in this section.&#x20;

### Reading the current value

Once we have a reference to the device stored on the variable `rotary`, we have access to the device's functions. To learn which functions the device has, we can consult the [official Python API documentation on the Tinkerforge website](https://www.tinkerforge.com/en/doc/Software/Bricklets/RotaryEncoderV2\_Bricklet\_Python.html).

Here we find that the Rotary Encoder Bricklet 2.0 has a function called `get_count`, which, according to the documentation, "_returns the current count of the encoder_". Let's give it a try:

```python
count = rotary.get_count()
print(count)
```

### Getting new values in real-time

```python
rotary = BrickletRotaryEncoderV2(UID, ipcon)

def count_changed(count):
    print(count)

rotary.register_callback(BrickletRotaryEncoderV2.CALLBACK_COUNT, count_changed)
rotary.set_count_callback_configuration(10, True, "x", 0, 0)
```

## Is this a sensor?

## Further reading

* [Python API documentation for the Rotary Encoder Bricklet 2.0](https://www.tinkerforge.com/de/doc/Software/Bricklets/RotaryEncoderV2\_Bricklet\_Python.html#api)
