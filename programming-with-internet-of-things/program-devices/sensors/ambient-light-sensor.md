# Ambient Light Sensor

Working with an [Ambient Light 2.0](https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Ambient\_Light\_V2.html) sensor works as described in the general article on [how to use sensors](./). In this article, we assume you have successfully initialized the devices with the [Tinkerforge Device Manager](../../tinkerforge-device-manager.md), and you stored all connected devices on a global variable `devices`. We also declared a global variable called `ambientLightSensor`.&#x20;

Next, we need to know the device identifier, which **259**:

```javascript
// Get the ambient light sensor via its device identifer
ambientLightSensor = devices.getDeviceByIdentifier(259);
```

Once we have a reference to the sensor, we can register a callback function:

```javascript
// We want to be informed when a new sensor value arrives
ambientLightSensor.registerListener(ambientLightChanged);
```

Of course we have to actually define that function:

```javascript
function ambientLightChanged(val) {
   // Do something with the value object
}
```

## Reading the light value

The sensor delivers only one value, which we can access via the `val` object. The value is the light intensity measured in Lux multiplied by 100:

```javascript
function ambientLightChanged(val) {
    // Get the value
    var value = val.getValue();
    log(value.value / 100.0 + " lx");
}
```
