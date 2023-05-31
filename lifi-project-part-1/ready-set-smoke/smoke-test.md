---
description: >-
  After the hardware is in one piece and the software is installed, let's run
  our first tests to see whether everything works properly.
---

# Smoke Test ⭐

<details>

<summary>Summary</summary>

In this lesson, you'll learn:

* How you can test the hardware components required for the LiFi-project.
* How the Brick Viewer works and how you can test the hardware components with it.
* What a smoke test is in engineering and why it's important.

This lesson is relevant for the [Exercise 1: Ready, Set, Smoke](https://winf-hsos.github.io/lifi-exercises/exercises/01\_exercise\_ready\_set\_smoke.pdf).

</details>

<figure><img src="../../.gitbook/assets/lifi_smoke_test.jpg" alt=""><figcaption><p>The LiFi prototype while running the program-based smoke test.</p></figcaption></figure>

## What's A Smoke Test For?

The term <mark style="background-color:green;">**smoke test**</mark> in industrial engineering and software development describes the attempt to run a new system for the first time to see whether there are any major issues. The term 'smoke test' likely originated in the plumbing industry, where smoke was blown into a new pipe system to detect any leaks. For us, the smoke test means that we connect the hardware stack to a computer and test whether all components are working as expected. For this purpose, we can use the [Brick Viewer from Tinkerforge](https://www.tinkerforge.com/en/doc/Software/Brickv.html), which we installed in the [previous lesson](development-environment.md). Or we can use the Tinkerforge Python <mark style="background-color:green;">**API**</mark> and perform a smoke test from a program.

We'll perform two smoke tests in this lesson:

1. Connect to the hardware kit from the Tinkerforge Brick Viewer and test the device's functions.
2. Connect to the hardware kit from a Python program and test each device's individual functions as well as their interactions.

The tests give us confidence that all devices are intact, everything is wired correctly, all the identifiers were collected properly, and our development environment is installed and configured. If the test result is positive, that is.

## The UI-Based Smoke Test

We'll perform the first smoke test using the Brick Viewer software from Tinkerforge. You installed this software [in the previous lesson](development-environment.md#brick-viewer-and-brick-daemon), along with the Brick Daemon. Both are required for this smoke test to work.

To perform the UI-based smoke test, follow these steps:

### 1. Open Brick Viewer And Connect

Open the Brick Viewer software on your computer. On Windows, I find it easiest to type "Brickv" in the search field. You should also find it somewhere in your start menu. Once the software is open, check the left-hand side and find the host and port settings. They should look as follows.

<figure><img src="../../.gitbook/assets/image (53).png" alt=""><figcaption><p>The Brick Viewer on start-up.</p></figcaption></figure>

If the host is "localhost" and the port is the default of 4223, you can click the large "Connect" button above it. Make sure you connect your hardware kit to your computer using the provided USB cable first.

### 2. Check If All Devices Were Found

If the connection was successful, you see a list of connected devices in the Brick Viewer's main area. The list should look very similar to the one in the screenshot, except for different values in the UID-column. The position of each device in the list can also differ, this depends on into which socket you plugged them during [hardware assembly](hardware-assembly.md). The firmware version in the last column could also be slightly different, depending on when you take this course.

<figure><img src="../../.gitbook/assets/image (1) (1) (2).png" alt=""><figcaption><p>The Brick Viewer shows a list of connected devices after a connection is established.</p></figcaption></figure>

### 3. Test Each Device's Functionality

The Brick Viewer is useful to explore the different devices and play around with their functionality. While you can do this all by yourself, the following lists give you some ideas on what to try out:

#### RGB LED Bricklet 2.0

* Obviously, light up the LED in different colors. There are pre-defined colors that you can activate with a button. There is also the option to use sliders for the red, green, and blue parts as well as for the alternative HSL (hue, saturation, lightness) of the color. Why not try both?
* Play around with the status LED of the RGB LED Bricklet. In what different ways can it be used? For the LiFi-project, what setting do you find most useful? By the way, the status LED is something that every device has.

#### Rotary Encoder Bricklet 2.0

* Try turning the knob in both directions to see what it does.
* Press down the knob and see where this is shown in the Brick Viewer.
* Try resetting the count to 0.

#### Color Bricklet 2.0

* The color sensor is interesting to test together with the RGB LED. Set the RGB LED to different colors and check how the color is perceived by the color sensor.
* Hold a light source close to the sensor (e.g., your smartphone LED) to see how this affects the different charts.
* Can you find the little checkbox to enable the sensor's own white LED?

#### OLED 128x64 Bricklet 2.0

* The OLED allows for setting every single pixel manually, but there is a built-in shortcut for writing character digits, too. Use the latter and write your name on the first line of the display. Notice something weird?
* Add your e-mail address to the second line.
* Add your signature to the drawing pane and send it to the display.
* What does the "Invert Pixels" checkbox do?

You now have a feeling for each of the four devices. There is a fifth device, the Master Brick, but it is only here to manage the access to the other four.

For the second part of the smoke test, I provide you with a Python script that you must download to your computer and then execute.

## The Program-Based Smoke Test

### Get The Code

The following link leads to the smoke test's code on GitHub. If you haven't done this already, it's now time to use your installation of Git to pull a copy of the repository to your computer.

{% embed url="https://github.com/winf-hsos/LiFi-code/blob/main/devices/smoke_test.py" %}

The easiest way to get a copy is to use Git. Make sure you are in the right directory where you want the LiFi-project's code to live, open a new terminal, and type:

```
git clone https://github.com/winf-hsos/LiFi-code.git
```

The benefit of using Git is that you can later update your project if any changes have been made. This can happen during a semester, and I encourage you to check for updates frequently. You can do this by typing this:

```
git pull
```

Now it's time to open the file `devices/smoke_test.py`. For our first program, it looks quite overwhelming, doesn't it? But don't worry: while it looks intimidating now, but by the end of this project, you can explain every single line. You can consider this a goal for this course.&#x20;

For now, we will only _run_ the code to see how the components work and interact from a Python program. We won't explain any of the code yet. We'll learn the necessary concepts during this course, and we'll come back to this later when we already have a better understanding.

### Before You Run The Code

Before you run the code, make sure you insert the UIDs for your hardware devices in the `config.yaml`. The UID is a unique identifier for each device that Tinkerforge produces. Your RGB LED will have a different UID than mine, and it will be different for everyone. For the smoke test to run (and for any program we want to use the devices with), we need to know the UID of our devices and add them to the `constants.py` module.&#x20;

If you don't know how to get your UIDs, see if you can find them using the Brick Viewer. The file looks like this for my personal LiFi-prototype.

```yaml
uid_rgb_led: "VRX"
uid_rotary_encoder: "XCh"
uid_oled_display: "25yE"
uid_color_sensor: "Whu"
uid_master: "6apah5"
port: 4223
host: "localhost"
```

Next, you need to install the dependencies we have in our smoke test program, which is the Tinkerforge API and [PyYAML](https://pypi.org/project/PyYAML/) for  loading the YAML-file. When you successfully installed Python, you should have access to the Python package manager `pip` from the command line. We can utilize the `pip` to install external modules. Make sure you are in the root directory of the LiFi-code project, and type the following into the terminal:

```
pip install tinkerforge
```

This will download the latest version of the Tinkerforge API and install it on your local Python environment. Finally, type the following and hit enter to install the PyYAML library:

```
pip install pyyaml
```

### Run The Code

Now, run the code by typing the following command in a terminal in Visual Studio Code:

```
python devices/smoke_test.py
```

If everything works, you should see a single line that reads "Please hit enter to exit". This means the program is running until you hit enter on your computer's keyboard. While the program is running, try to figure out what the smoke test does. Play around with the hardware and see how changes to the rotary encoder affect the other components. Another way is to have a look at the code, but it's understandable if that doesn't help you much at this point. We'll change that soon, and we start by introducing the LED and how to use it from a Python program in the next lesson of this course.
