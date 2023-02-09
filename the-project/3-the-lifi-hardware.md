# 3 - The LiFi Hardware

## Components

* RGB LED
* Color sensor
* Master Brick
* OLED display
* Rotary Encoder

## Connecting to the Hardware

```python
HOST = "localhost"
PORT = 4223
UID = "xxxxx" # Change to the UID of your Master Brick

from tinkerforge.bricklet_rgb_led import BrickletRGBLED

ipcon = IPConnection()
master = BrickMaster(UID, ipcon)
ipcon.connect(HOST, PORT)
```
