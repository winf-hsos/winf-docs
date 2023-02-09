# RGB LED Button

We can make our application more interactive and get user input using the [RGB LED Button](https://www.tinkerforge.com/en/doc/Hardware/Bricklets/RGB\_LED\_Button.html). In this article, we assume you have successfully initialized the devices with the [Tinkerforge Device Manager](broken-reference), and you stored all connected devices on a global variable `devices`. We also declared a global variable `button`.

Next, we need to know the device identifier of the RGB LED Button, which is **282**:

```javascript
// Get a reference to the button and store in on the global variable
button = devices.getDeviceByIdentifier(282);
```

Now that we have a reference to the button on the variable `button`, we can use that variable to call the button's LED functions. These are the same as for the [RGB LED](rgb-led.md).

## Set the color of the button's LED

With `setColor()` we can turn the button's LED on and specify the color of the light. We define the color using the RGB notation:

```javascript
// Set the button's LED to red
button.setColor(255, 0, 0);

// Set the button's LED to green
button.setcolor(0, 255, 0);
```

## Turning the button's LED off

We can turn the button's LED off (black) at any time with the shortcut function `off()`:

```javascript
// Turn the LED off
button.off();
```

## Let the button's LED blink in a color

Similar to setting the color, we can use `blink()` to make the button's LED blink at a given frequency:

```javascript
// Make the button's LED blink in green at a 500 ms interval
button.blink(0, 255, 0, 500);
```

## Listen to button presses

The more important functionality of button is to react to the event that someone pressed the button. We can achieve this using the listener button and a callback function, as we do with sensors:

```javascript
// Register a callbacl function for button presses
button.registerListener(buttonChanged);
```

Within the callback function, we can distinguish the two events "PRESSED" or "RELEASED":

```javascript
function buttonChanged(val) {
    // Get the state of the button
    var state = val.getValue();
    
    if(state == "PRESSED") {
        // Do something
    }
    else if (state == "RELEASED") {
        // Do something else
    }
}
```
