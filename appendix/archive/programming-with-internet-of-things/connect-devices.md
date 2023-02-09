# Connect Devices

The following code connects to devices on your local USB port:

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

## Global variable to store the devices

In line 2, we define the _global variable_ `devices`. A global variable is defined outside of any function, and it's good practice to declare them at the top of your program, so we can easily find them.

The difference between a global and a local variable is their visibility. While we can access global variables from anywhere in our program, a local variable can only be used in the block where we defined it. This could be a function, for example. If you know we need a variable only within a function, it is good practice to define it locally within that function.

## Initialize the devices

When we import the Tinkerforge Device Manager in our web project, we automatically get access to a global variable called `tf` (short for _Tinkerforge_). This variable stores a reference to the Tinkerforge Device Manager (TDM) and all its functionality. One of the functions is `initDevices()`, which - as the name suggest - tells the TDM to start the initialization process and get a connection to all devices at the computer's USB port. We call this function in line 5. As an argument, we pass a reference to a function `initDone()`. We define this function starting in line 8. This function serves as a so called _callback function_, and it will be called by the TDM when the initialization process finishes.

To hand as the result, which are all references to the connected devices, the TDM uses the single argument `connectedDevices` of the callback function. Via this variable, we get access to all devices and their functions. To make sure we can access the devices from anywhere in our program, and not just from the `initDone()` function, we store the argument on the global variable `devices` that we defined earlier (line 10).

## Change the default port

If you want to use a different port to connect to the Tinkerforge devices, you can use the `setPort()` function:

```javascript
// Set to your favorite port
tf.setPort(4281);

// This initializes the connections
tf.initDevices(initDone);
```

{% hint style="success" %}
Make sure you also change the port in the Brick Daemon's config file and restart the service.
{% endhint %}

Additionally, you can also change the host:

```javascript
tf.setHost("192.168.0.1");
```
