---
description: >-
  The color sensor detects light and measures its spectrum. This will be useful
  when we want to receive messages from a light source.
---

# The Color Sensor ⚡

<details>

<summary>Summary</summary>

In this lesson, you'll learn:

* How to connect to the color sensor.
* How to read the different values measured by the sensor.
* How to apply the concept of callback functions to be notified of new values.

This lesson is relevant for [Exercise 4: Digitizing The Physical World](https://winf-hsos.github.io/lifi-exercises/exercises/04_exercise_digitizing_the_physical_world.pdf).

You find the code examples in the [LiFi-code GitHub repository](https://github.com/winf-hsos/LiFi-code) in [`devices/color_sensor.py`](https://github.com/winf-hsos/LiFi-code/blob/main/devices/color_sensor.py).

</details>

In the previous lesson, you were taught the process of converting an analog signal into a digital representation using two techniques, namely sampling and quantization. Sensors operate on the same principle. They measure different physical properties of the world, such as temperature, humidity, or the wavelength of light (which is known as color), and then transform that property into an electric current. This electric current can be quantified and then turned into a series of discrete numbers using an analog-to-digital converter (ADC).

In the upcoming lesson, you will delve deeper into how the color sensor works to measure light. However, this particular lesson's main focus is on teaching you how to use the sensor in your Python programs to build the LiFi prototype.

![](<../../.gitbook/assets/image (3).png>)

## Initialize the Sensor

Like any other device, we need to initialize the sensor and store a reference to it in a variable so that we can access it later. We'll use a variable with the name `color_sensor`:

```python
color_sensor = BrickletColorV2(constants.UID_COLOR_SENSOR, ipcon)
```

## Read the Current Measurements

Similar to what we learned about [the-rotary-encoder.md](../../archive/the-rotary-encoder.md "mention"), we can read values directly when we need them instead of being automatically informed of new values using a callback function (push principle):

```python
# Read the current measurements (pull principle)
current_color = color_sensor.get_color()
print(f"Current color: R: { current_color.r }, G: { current_color.g } / B: { current_color.b }")
# Output: Current color: R: 22651, G: 24595 / B: 19106

current_illuminance = color_sensor.get_illuminance()
print(current_illuminance)
# Output: 17482

current_color_temperature = color_sensor.get_color_temperature()
print(current_color_temperature)
# Output: 5097
```

Actively requesting values can be useful in some situations. However, typically, we prefer to be automatically informed about new values. To achieve this, we can use the concept of callback functions.

## Getting Automatically Informed

Using a callback function involves three steps:

1. Define a callback function with the parameters (if any) for the new values. Note that not all callback functions require a parameter. For example, the rotary encoder's button callbacks do not have any parameters. Calling the function alone is sufficient to indicate that the button was pressed or released. This is different for the color sensor.
2. Register the callback function with the device.
3. Configure the callback mechanism to set the interval and potential threshold values.

Let's look at how this can be done for the color values of the sensor. The sensor measures 4 different aspects of the color, which according to the [Tinkerforge API documentation](https://www.tinkerforge.com/en/doc/Software/Bricklets/ColorV2_Bricklet_Python.html#color-v2-bricklet-python-api) translates to four parameters:

```python
# 1. Define the callback function
def new_color_value(r, g, b, c):
    print(f"R: { r }, G: { g }, B: { b }, C: { c }")
```

Next, we can take the function's name `new_color_value` and pass it to the `register_listener` function. As the first parameter, we need to specify the type of event we want to register the callback function for. In this case, we can reference this type using the provided constant `CALLBACK_COLOR` from the color sensor's API:

```python
# 2. Register the callback function
color_sensor.register_callback(BrickletColorV2.CALLBACK_COLOR, new_color_value)
```

Finally, we must configure the callback mechanism. In the example below, we ask for a new value every second (1000 milliseconds) and we specify that the values don't have to change:

```python
color_sensor.set_color_callback_configuration(1000, False)
```

From now on, we'll get a call to `new_color_value` every second, receiving a new color value. We can decide what we want to do with that value. In the LiFi prototype, we want to convey information using light signals. Using different colors and recognizing them might be useful for that. We'll dwell on this topic in the upcoming lesson [signals-over-light.md](signals-over-light.md "mention").

For examples of the other two values, color temperature and illuminance, refer to the [example code in the LiFi repository on GitHub](https://github.com/winf-hsos/LiFi-code/blob/main/examples/color_sensor.py).

In the next lesson, we will explore how to use a color sensor not only to measure the wavelength of light, but also to interpret different wavelengths or colors as signals.

