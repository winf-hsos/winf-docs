---
description: >-
  The rotary encoder is a simple device for humans to input information to a
  digital computer. It can be used for controlling various aspects of a system.
---

# The Rotary Encoder ⚡

<details>

<summary>Summary</summary>

In this lesson, you'll learn:

* How to connect to the rotary encoder from a Python program.
* How to read the current value of the rotary encoder.
* How to get frequent updates about values changes of the rotary encoder.
* How to use the button functionality of the rotary encoder.
* What a callback function is and how it works.

You find the code examples in the [LiFi-code GitHub repository](https://github.com/winf-hsos/LiFi-code) in [`devices/rotary_encoder.py`](https://github.com/winf-hsos/LiFi-code/blob/main/devices/rotary\_encoder.py).

This lesson is relevant for [Exercise 3: On and Off](https://github.com/winf-hsos/lifi-exercises/blob/main/exercises/03\_exercise\_on\_and\_off.pdf).

</details>

## The Rotary Encoder

<img src="../../.gitbook/assets/image (1) (2) (1).png" alt="" data-size="original">

The rotary encoder is a commonly used control mechanism in a variety of hardware applications. Its operation is relatively simple: the user can rotate the knob in either direction, which in turn changes a numerical value represented by the control. Rotating the knob to the right increases the value, while rotating it to the left decreases it. However, the rotary encoder also has another useful feature: it doubles as a button. When the user presses down on the knob, it triggers an event which can then be used to perform a specific action. This feature can be particularly useful in situations where multiple inputs are required from a single control, or where space is at a premium, and it is desirable to minimize the number of controls used.

### Initialize The Rotary Encoder

Before interacting with any device, we need to establish a connection to it and store a reference to the device in a variable. To achieve this, we can use the following lines of code. It is assumed that an IP connection has already been created and that the `ipcon.connect()` command has been executed:

{% code lineNumbers="true" %}
```python
from tinkerforge.bricklet_rotary_encoder_v2 import BrickletRotaryEncoderV2
rotary = BrickletRotaryEncoderV2("xxx", ipcon)
```
{% endcode %}

Make sure you replace the UID with [your device's UID](../logic-with-the-led/the-led.md#how-to-get-a-devices-uid) before you proceed with this lesson.&#x20;

### Reading The Current Value

After storing a reference to the device in the `rotary` variable, we gain access to the device's functions. To learn about the available functions, we can consult the [official Python API documentation for the specific device](https://www.tinkerforge.com/en/doc/Software/Bricklets/RotaryEncoderV2\_Bricklet\_Python.html) on the Tinkerforge website.

In the case of the Rotary Encoder Bricklet 2.0, we can find a function called `get_count`. According to the documentation, this function _"returns the current count of the encoder_". Let's try using it:

```python
count = rotary.get_count()
print(count)
```

### Getting New Values In Real-Time

While we can read the value of the rotary encoder at any time using the `get_count()` function (as discussed earlier), this approach requires us to manually check for changes and determine when to do so. If we want to be notified of any changes to the encoder value immediately, we can make use of <mark style="background-color:green;">**callback functions**</mark>.

A callback function is a function that is called automatically by the system whenever a specific event occurs, in this case, a change in the encoder value. By registering a callback function with the rotary encoder, we can ensure that our code is notified of changes to the encoder value as soon as they occur, without the need for manual polling.

<img src="../../.gitbook/assets/file.excalidraw (3) (3) (1).svg" alt="The mechanism of a callback function." class="gitbook-drawing">

A good analogy for understanding callback functions is to think of them as a personal assistant. Imagine you're a busy executive with a packed schedule, and you've asked your assistant to keep you updated on any changes to your calendar. When something new is added, your assistant immediately calls you to let you know.

In this scenario, you are the main program, and your assistant is the callback function. You've given your assistant instructions to notify you immediately of any changes to your calendar, just as a callback function is given instructions to execute immediately when an event occurs.

Similarly, when working with Tinkerforge devices, we use callback functions to be notified of events, such as changes to the rotary encoder position or button presses. Instead of waiting for the main program to manually check for changes, the callback function is called automatically by the system when the event occurs.

To use a callback function, we must first define it and then register it with the Tinkerforge device. Just as you would provide your assistant with your phone number, we pass the callback function to the API to be called when the event occurs. This ensures that the callback function is triggered immediately, allowing our program to respond to changes in real-time.

In the code below, we use the `register_callback` function to specify the event and the callback function to execute when that event happens (line 6). We pass both as arguments:

{% code lineNumbers="true" %}
```python
rotary = BrickletRotaryEncoderV2(UID, ipcon)

def count_changed(count):
    print(count)

rotary.register_callback(BrickletRotaryEncoderV2.CALLBACK_COUNT, count_changed)
rotary.set_count_callback_configuration(10, True, "x", 0, 0)
```
{% endcode %}

The event is passed via a constant named `CALLBACK_COUNT` from the `BrickletRotaryEncoderV2` object. As we can read in the [API documentation](https://www.tinkerforge.com/en/doc/Software/Bricklets/RotaryEncoderV2\_Bricklet\_Python.html#rotary-encoder-v2-bricklet-python-callbacks), this event can be used to be notified about the current value (count) of the rotary encoder. To be notified only when someone turns the rotary encoder in either direction, and thus changes the value, we instruct the rotary encoder by passing a callback-configuration (line 7). In the example above, we wish to be updated in a 10 ms interval (first parameter), but only if the value has changed (second parameter, which is `True`). The "x" means we do not specify a threshold, and the two following zeroes are placeholders for the minimum and maximum values if we actually wanted to specify a threshold.

The callback function `count_changed` must be defined **before** the callback registration. In the example above, the function merely prints the current value to the console.

## Is This A Sensor?

We said earlier that we can classify most devices into two groups: <mark style="background-color:green;">**sensors**</mark> and <mark style="background-color:green;">**actuators**</mark>. So, what is the rotary encoder?

We could make the argument that controls like the rotary encoder are in fact sensors. What sensors have in common is that they _sense_ something from the real, analog world. They often do this by measuring a property that acts as a proxy. For example, a specific type of temperature sensor measures the electric current flowing through a piece of metal. Knowing that the resistance of the metal changes with temperature and how, which changes the current flowing as well, we can infer the temperature from the measured current.&#x20;

What about the rotary encoder? We could analogously say that it measures the force applied to it along with the force's direction and uses it as a proxy for determining whether the value should go up or down. Or whether the user's intention was a button press. In that sense, the rotary encoder measures some form of energy (directed force) and is therefore a sensor.

It does not classify as an actuator because it cannot act in the real world in any way.

## Further Reading

* [Python API documentation for the Rotary Encoder Bricklet 2.0](https://www.tinkerforge.com/de/doc/Software/Bricklets/RotaryEncoderV2\_Bricklet\_Python.html#api)
