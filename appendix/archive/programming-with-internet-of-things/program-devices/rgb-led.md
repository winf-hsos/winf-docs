# RGB LED

Using the [RGB LED](https://www.tinkerforge.com/en/doc/Hardware/Bricklets/RGB\_LED.html) in our program is straightforward. In this article, we assume you have successfully initialized the devices with the [Tinkerforge Device Manager](broken-reference), and you stored all connected devices on a global variable `devices`. We also declared a global variable `led`.

Next, we need to know the device identifier of the RGB LED, which is **271**:

```javascript
// Get a reference to the LED and store in on the global variable
led = devices.getDeviceByIdentifier(271);
```

Now that we have a reference to the LED on the variable `led`, we can use that variable to call the LED's functions.

## Set the color of the LED

With `setColor()` we can turn the LED on and specify the color of the light. We define the color using the RGB notation:

```javascript
// Set the LED to red
led.setColor(255, 0, 0);

// Set the LED to green
led.setcolor(0, 255, 0);
```

## Turning the LED off

We can turn the LED off (black) at any time with the shortcut function `off()`:

```javascript
// Turn the LED off
led.off();
```

## Let the LED blink in a color

Similar to setting the color, we can use `blink()` to make the LED blink at a given frequency:

```javascript
// Make the LED blink in green at a 500 ms interval
led.blink(0, 255, 0, 500);
```

That's it, we can't do more with an [RGB LED](https://www.tinkerforge.com/en/doc/Hardware/Bricklets/RGB\_LED.html).
