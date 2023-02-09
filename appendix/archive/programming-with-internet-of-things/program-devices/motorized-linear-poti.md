# Motorized Linear Poti

We can use the [Motorized Linear Poti](https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Motorized\_Linear\_Poti.html) to let the user control some aspect of our application using a physical control. The poti can take on values on a range between 0 and 100.&#x20;

Using the [Tinkerforge Device Manager](broken-reference), we can use simple functions to perform the most important tasks. In this article, we assume you have successfully initialized the devices with the [Tinkerforge Device Manager](broken-reference), and you stored all connected devices on a global variable `devices`. We also declared a global variable `poti`.

Next, we need to know the device identifier of the Motorized Linear Poti, which is **267**.:

```javascript
// Get a reference to the poti device and store in on the global variable
poti = devices.getDeviceByIdentifier(267);
```

Now that we have a reference to the display on the variable `poti`, we can use that variable to call the device's functions.

## Get the updates about the position

In a sense, the Motorized Linear Poti acts like a sensor: We can register a listener to get updates about changes to its position. We first register the listener:

```javascript
poti.registerListener(potiChanged);
```

In the callback function, we can distinguish between two types of updates from the device:

```javascript

function potiChanged(val) {

    // Get the value
    var value = val.getValue():
    
    if(value.type == "position") {
        // Do something
    }
    else if (value.type == "position_reached") {
        // Do something else
    }
}
```

If we are only interested in the position of the poti, regardless of whether it was changed by hand or the motor, we can use the event type "position". If we are using the motor, as described further below, and we want to know when the motor is done moving the slider, we can use the event type "position\_reached". This is only fired when the motor was used and it has finished the move.

{% hint style="info" %}
Note that you'll get each position changed using the motor also via the event "position".
{% endhint %}

## Set the position using the motor

A nice feature of the Motorized Liner Poti is that it has a motor that lets us set the value programmatically:

```javascript
// Set the poti to position 75 using the integrated motor
poti.setPosition(75);
```

The motor moves the slider, which will take a couple of milliseconds. If we want to know when the motor is done, we can check for the "position\_reached" event, as described above.
