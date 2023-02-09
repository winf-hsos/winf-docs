# 4 - Programming the LED ⭐

## Connecting to the Device

The connection to the LED is established through the Master Brick to which the LED is connected using a 7-pole wire.

```python
HOST = "localhost"
PORT = 4223
UID = "xxxxx" # Change to the UID of your Master Brick

from tinkerforge.bricklet_rgb_led import BrickletRGBLED

ipcon = IPConnection()
master = BrickMaster(UID, ipcon)
ipcon.connect(HOST, PORT)

UID_LED = "xxx" # Change to the UID of your RGB LED
led = BrickletRGBLED(UID_LED, ipcon)
```

## Random Numbers

```python
import random
r = random()
```

## Control Structures

```python
if r > 0.5:
    pass
elif:
    pass
```
