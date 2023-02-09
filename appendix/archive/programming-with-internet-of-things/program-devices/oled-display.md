# OLED Display

We can use the [OLED Display](https://www.tinkerforge.com/en/doc/Hardware/Bricklets/OLED\_128x64\_V2.html) to output information to the user of our application. Using the [Tinkerforge Device Manager](broken-reference), we get easy to use functions to perform the most important tasks. In this article, we assume you have successfully initialized the devices with the [Tinkerforge Device Manager](broken-reference), and you stored all connected devices on a global variable `devices`. We also declared a global variable `oledDisplay`.

Next, we need to know the device identifier of the OLED Display. Depending on the size of the display, the identifier is either **263** (128 x 64) or **264** (64x48). In this example, we have the former:

```javascript
// Get a reference to the display and store in on the global variable
oledDisplay = devices.getDeviceByIdentifier(263);
```

Now that we have a reference to the display on the variable `oledDisplay`, we can use that variable to call the display's functions.

## Writing text

Writing text is straightforward. The function `write()` takes 3 arguments: The first two are the line number and the column number where the text should show up. The last argument is the text itself:

```javascript
oledDisplay.write(0, 0, "Willkommen");
```

{% hint style="info" %}
The OLED 128x64 has a maximum of 8 lines and 26 columns for characters. The counting starts at zero, so you can write in line 1 with `write(0, 0, "Hello");`
{% endhint %}

## Clear text

You can clear the whole display:

```javascript
oledDisplay.clearDisplay();
```

Or you can clear just a single line:

```javascript
// Clear the first line of the display
oledDisplay.clearLine(0);
```
