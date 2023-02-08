# Humidity Sensor

Working with a [Humidity 2.0](https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Humidity\_V2.html#humidity-v2-bricklet) sensor works as described in the general article on [how to use sensors](./). In this article, we assume you have successfully initialized the devices with the [Tinkerforge Device Manager](../../tinkerforge-device-manager.md), and you stored all connected devices on a global variable `devices`. We also declared a global variable called `humiditySensor`.&#x20;

Next, we need to know the device identifier, which **283**:

```javascript
// Get the humidity sensor via its device identifer
humiditySensor = devices.getDeviceByIdentifier(283);
```

Once we have a reference to the sensor, we can register a callback function:

```javascript
// We want to be informed when a new sensor value arrives
humiditySensor.registerListener(humidityChanged);
```

Of course we have to actually define that function:

```javascript
function humidityChanged(val) {
   // Do something with the value object
}
```

## Distinguish between temperature and humidity

Since the sensor delivers two different value types, temperature and humidity, why not use the callback function to illustrate how we can distinguish both types:

```javascript
function humidityChanged(val) {
    // Get the value
    var value = val.getValue():
    
    if(value.type == "temperature") {
        // Do something
    }
    else if (value.type == "humidity") {
        // Do something else
    }
}
```

That is basically it - we can't do anything else with a [Humidity 2.0](https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Humidity\_V2.html#humidity-v2-bricklet) sensor.
