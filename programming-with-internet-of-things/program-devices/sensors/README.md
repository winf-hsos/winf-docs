---
description: >-
  Sensors are important parts of an Internet of Things application, as they
  allow machines to take data from the physical world and transform it into a
  computer processable digital form.
---

# Sensors

When writing applications that involve sensors, we apply the same approach for all types of sensors:

1. [Connect to the sensor](../../connect-devices.md) using the [Tinkerforge Device Manager](../../tinkerforge-device-manager.md).
2. Store a reference to the sensor on a global variable.
3. Register a listener function to get informed about new values from the sensor.
4. Within the listener function, we can then work with the value we received.

## Initialize devices

The following code connects to all devices on our local USB port:

```javascript
// A global variable to store all devices
var devices;

// This initializes the connections
tf.initDevices(initDone);

// Call this when all connections are established
function initDone(connectedDevices) {
    // Store the devices on the global variable
    devices = connectedDevices;
}
```

## Getting and storing the sensor

To illustrate the process, let's assume we have a humidity sensor connected to our Master Brick. In this case, we can get and store a reference to that sensor by extending the code as follows:

```javascript
// A global variable to store all devices
var devices;

// A global variable to store the sensor
var humiditySensor;

// This initializes the connections
tf.initDevices(initDone);

// Call this when all connections are established
function initDone(connectedDevices) {
    // Store the devices on the global variable
    devices = connectedDevices;
    
    // Get one specific device via its UID
    humiditySensor = devices.getDeviceByIdentifier(283);
}
```

The function `getDevicesByIdentifier()` is part of the `devices` object that we get back from the initialization process. We need to know the device identifier of the sensor and pass it to the function. You can [look up the identifiers here](https://www.tinkerforge.com/en/doc/Software/Device\_Identifier.html), or you can simply take a look at the console, where all connected devices are listed:

![](<../../../.gitbook/assets/image (23).png>)

The humidity sensor has the device identifier 283, and if the sensor is actually connected, line 16 in the code above will return a reference to that sensor. We then store that reference on our global variable `humiditySensor`, so that we can access the sensor from anywhere in our code.

## Listen to sensor updates

Now that we have the sensor in our hands (or in our variable), we can tell the sensor to inform us about new values. The way we do that in programming is called the listener or [observer pattern](https://en.wikipedia.org/wiki/Observer\_pattern). You can image it in this way: We tell the sensor: "Hey, let me know anytime there is a new value. You can do this by calling this function I give you". We call the function the sensor should call a **callback function**, and we must define the function accordingly:

```javascript
// Call this when all connections are established
function initDone(connectedDevices) {
    // Store the devices on the global variable
    devices = connectedDevices;
    
    // Get one specific device via its UID
    humiditySensor = devices.getDeviceByIdentifier(283);
    
    // We want to be informed when a new sensor value arrives
    humiditySensor.registerListener(humidityChanged);
}

function humidityChanged(val) {
  log(val.getValue());
}
```

In line 10, we call the `registerListener()` function and pass our local function `humidityChanged()` as an argument. This is the **callback function** the sensor calls when there is a new value available. As as argument of the callback function, the sensor passes an object that contains information about the new value (the value itself, along with a timestamp and some other meta data).

To obtain only the value from this object, we can call the `getValue()` function, which returns a JSON object with two fields:&#x20;

```javascript
{
    "type": "temperature",
    "value": 2321
}
```

In the callback function above, we don't do much with the new sensor value. We simply print it to the console. But you can imagine that we can do much more with it, for example control the A/C or the sun blinds of a greenhouse.

{% hint style="info" %}
There are sensors that send more than one value with this object. In this case we can pass an argument to the `getValue()` function to specify the value type we want.
{% endhint %}

## Defining how often we want to be informed

We can add an additional line of code and tell the sensor in which frequency we want to be informed about updates:

```javascript
// We only want to be informed every 5 seconds
humiditySensor.setCallbackInterval(5000);
```

In the example above, we set the **callback interval** to 5000 milliseconds or 5 seconds. This means our callback function will only be called every 5 seconds if there was a new value in that time interval.

## Finished code

Here is the complete code from this article:

```javascript
// A global variable to store all devices
var devices;

// A global variable to store the sensor
var humiditySensor;

// This initializes the connections
tf.initDevices(initDone);

// Call this when all connections are established
function initDone(connectedDevices) {
    // Store the devices on the global variable
    devices = connectedDevices;
    
    // Get one specific device via its UID
    humiditySensor = devices.getDeviceByIdentifier(283);
    
    // We want to be informed when a new sensor value arrives
    humiditySensor.registerListener(humidityChanged);
    
    // We only want to be informed every 5 seconds
    humiditySensor.setCallbackInterval(5000);
}

function humidityChanged(val) {
  log(val.getValue());
}
```

