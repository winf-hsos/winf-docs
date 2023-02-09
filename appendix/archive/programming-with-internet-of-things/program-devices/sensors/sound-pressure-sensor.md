# Sound Pressure Sensor

Working with an [Sound Pressure Level](https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Sound\_Pressure\_Level.html) sensor works as described in the general article on [how to use sensors](./). In this article, we assume you have successfully initialized the devices with the [Tinkerforge Device Manager](broken-reference), and you stored all connected devices on a global variable `devices`. We also declared a global variable called `sound`.&#x20;

Next, we need to know the device identifier, which **290**:

```javascript
// Get the sound pressure level sensor via its device identifer
sound = devices.getDeviceByIdentifier(290);
```

Once we have a reference to the sensor, we can register a callback function:

```javascript
// We want to be informed when a new sensor value arrives
sound.registerListener(soundChanged);
```

Of course we have to actually define that function:

```javascript
function soundChanged(val) {
   // Do something with the value object
}
```

## Reading the sound pressure level

Instead of just one single value, the sensor delivers four different values:

1. Sound level in decibel
2. Spectrum length
3. Spectrum chunk offset
4. Spectrum chunk data

We can access the array of value via the `val` object:

```javascript
function soundChanged(val) {

    // Get the decibel value
    var decibelValue = val.getValue("decibel_value");
    
    // Check if this actually was decibel event, if not we get -1 as result
    if(decibelValue !== -1 && decibelValue.type === "decibel_value") {
        log("Decibel: " + decibelValue.value)
    }
}
```
