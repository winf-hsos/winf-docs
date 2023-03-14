---
description: >-
  To start the project, we need an understanding of the different hardware
  parts. We start with the LED. Plus, we introduce some basic programming
  concepts.
---

# 5 - The LED ⚡

<details>

<summary>Summary</summary>

In this lesson, you'll learn how to work with the LED from a Python program:

* Communicate with the hardware devices from our computer.
* Set the LED to a specific color.
* Turn off the LED.
* Ask the LED for its current color.

Moreover, you'll understand:

* How LEDs work.
* What the difference between an actuator and a sensor is.

You can find the code example from this lesson in the [LiFi-code GitHub repository](https://github.com/winf-hsos/LiFi-code) under [`examples/rgb_led.py`](https://github.com/winf-hsos/LiFi-code/blob/main/examples/rgb\_led.py).

</details>

## <img src="../.gitbook/assets/image (45).png" alt="" data-size="original">

## Talking to Hardware

The LED plays an important role in our LiFi project and the solution we're building. It acts as the sender for information we share between two robots, which requires a way to control the LED from a program. Luckily, the hardware manufacturer Tinkerforge has provided a way to do exactly that. They wrote an <mark style="background-color:green;">**application programming interface (API)**</mark> for their hardware devices for many modern programming languages, including Python.

When we write a Python program in Visual Studio Code, and we need access to the Tinkerforge devices, we can utilize the Tinkerforge Python API for that. And even if we are doing the same from the Brick Viewer (as we did in the [first of the two smoke tests](smoke-tests.md#the-ui-based-smoke-test)), we are still going through that same Python API. The reason is that the Brick Viewer is written in Python, too. If it were written in another programming language, like Java, it would use the respective API for that language.

<img src="../.gitbook/assets/file.excalidraw (7).svg" alt="We use the Tinkerforge Python API to establish an IP-connection with the Brick Daemon, who acts as a bridge to the hardware." class="gitbook-drawing">

## Connect To The LED

To communicate with any of the devices in our LiFi prototype, we need to establish an <mark style="background-color:green;">**IP-connection**</mark> to the Master Brick, which is connected to our computer via a USB cable. Tinkerforge uses the <mark style="background-color:green;">**IP-protocol**</mark> to connect to devices, which you might recognize as the same protocol used on the internet to connect computers worldwide.

Once the connection is active, we can reference a specific device by passing its <mark style="background-color:green;">**unique identifier (UID)**</mark> over the IP-connection. This allows us to communicate with the device and control its behavior.

### Importing Modules

We have already collected the UID for all of our devices in the previous smoke test. One important concept in programming is "Don't repeat yourself", and we should reuse the UID for this and all subsequent examples. We can do this by importing the `constants.py` file, which in Python we call a <mark style="background-color:green;">**module**</mark>:

```python
import constants
```

Since we're at it, let's import the other two modules we need, or some specific elements from them:

```python
from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_rgb_led_v2 import BrickletRGBLEDV2
```

This looks a bit different from the first import of the `constants` module. This because in the two lines above, we only want to import two specific <mark style="background-color:green;">**objects**</mark> from two different Tinkerforge modules. In that case, we can use the `from` keyword together with `import` followed by a list of the specific objects we require. With `import constants`, we get everything from the module `constants`, which can be too much if the modules are large.

You will learn more about modules in an [upcoming lesson](programs.md#create-once-use-often).

### Create The Reference

Now we have imported all the external stuff we need, and we proceed to create the IP-connection:

```python
ipcon = IPConnection()
ipcon.connect(constants.HOST, constants.PORT)
```

You can see that the IP-connection required the information about the host and port to connect to. We saved this in the `constants`-module, too, so we can simply reference it here.

With the active IP-connection, we can go ahead and instantiate the LED object:

```python
led = BrickletRGBLEDV2(constants.UID_RGB_LED, ipcon)
```

The LED is represented in our Python program through an instance of the Python class `BrickletRGBLEDV2`, which is provided by the Tinkerforge API. When we create (or instantiate) this object, we need to provide the UID and an active IP-connection. Because we want to access the LED later in our program, we store the object in a variable with the name `led`.&#x20;

A variable is an important concept in programming, and it allows us to store things in memory for later use. You will learn more about variables in an [upcoming lesson](programs.md#1.-variables).

We now have a reference to the LED, which gives us access to all functionalities exposed by the [LED's API](https://www.tinkerforge.com/en/doc/Software/Bricklets/RGBLEDV2\_Bricklet\_Python.html#rgb-led-v2-bricklet-python-api). Let's explore what they are.

## Turning On The LED From Python

One major function of an LED is to change its color. To start with, we will set the RGB LED to a green color:

```python
# Set to full green color
led.set_rgb_value(0, 255, 0)
```

The line above set the LED's color to green by using the corresponding <mark style="background-color:green;">**RGB code**</mark>. We'll address the RGB code in detail in the section about [code-systems.md](code-systems.md "mention"). To understand the above line of code, all we need to know is that the three parameters are for the red, green, and blue parts of the color. All parts are set to zero, except for the green part. The value 255 happens to be the largest value a part can have, so thus it resolves to pure, bright green.

## Running The Program

We are now ready to execute the program to see if it actually works. But how do we execute a Python program? With the installation of [#python-as-our-programming-language](development-environment.md#python-as-our-programming-language "mention"), we can run a command named `python` from our <mark style="background-color:green;">**terminal**</mark> (or <mark style="background-color:green;">**command line**</mark>). As the first and only <mark style="background-color:green;">**argument**</mark>, we need to specify the file that contains the program we want to execute. When we are in the folder where the program file is located, we simply type the filename `rgb_led.py` after the `python` command and separate both with a space:

```bash
python rgb_led.py
```

### Terminals In Visual Studio Code

How do we get access to a terminal? We can do this directly in Visual Studio Code: in the main top menu of Visual Studio Code, click on "Terminal" and then "New Terminal".  A new black pane opens, usually in the lower-right corner of Visual Studio Code. This is the terminal, and if you have worked with the command line (or terminal) in Windows or Mac before, you might recognize it.

<figure><img src="../.gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

Unfortunately, not all terminals are equal, and there are different types. When you open a new terminal in Visual Studio Code, it will open the default type that is currently configured. On Windows, this is often the so-called PowerShell. We want to change this and set the default to the Windows command line (or _cmd_). The easiest way to set the default terminal is:

1. Hit F1 on your keyboard to open the Visual Studio Code command palette.
2. In the appearing search bar, type "Select default profile" and click on the first result.
3. From the list, choose "Command Prompt".

<figure><img src="../.gitbook/assets/image (1) (1) (2).png" alt=""><figcaption><p>There are different terminal profiles we can set as default.</p></figcaption></figure>

Now try to open a new terminal as described above. It should now be of the new default type "Command Prompt". Finally, type the command to run your program into the terminal and hit enter:

```bash
python rgb_led.py
```

Voilà! The LED lights up in green color.

<figure><img src="../.gitbook/assets/rgb_led_green.jpg" alt=""><figcaption><p>The RGB LED set to the RGB value R = 0, G = 255, B = 0.</p></figcaption></figure>

### Common Errors

In the following, I want to address frequent errors and their solutions when running a Python program from a terminal. There is a great chance you might encounter the one or the other in your first attempts.

#### File Not Found

You might see the following message after you hit enter:

```
can't open file '...\rgb_led.py': [Errno 2] No such file or directory
```

Python is telling you it can't find the file you specified, in this case `rgb_led.py`. In most cases, this is because you are not in the same directory as the file you are trying to run. The current directory is displayed in your terminal, usually right before the cursor:

<figure><img src="../.gitbook/assets/image (5).png" alt=""><figcaption></figcaption></figure>

In my example, I am in the directory `C:\code\LiFi-code`, and if I run `python rgb_led.py`, the Python command will assume the file is in the current directory, which it isn't. It is one folder below in `examples\rgb_led.py`. You can check this on Windows by typing the command `dir`, and on Mac and Linux the equivalent command is `ls`. Both will print all files and directories that are in the current directory.&#x20;

So to solve the above problem, there are three possible solutions:

1. Change to the directory `examples` where the file `rgb_led.py` is saved. On Windows, Mac, and Linux, you can use the `cd` command for that. If you need help with this simple command, ask Google or the chatbot of your choice.
2. Give Python the full relative path. Instead of typing `python rgb_led.py` , you could specify the subfolder directly: `python examples\rgb_led.py`.&#x20;
3. Move the file `rgb_led.py` to the directory you are currently in. This makes sense if you accidentally saved a file in the wrong location on your computer. In this case, the file is in the right directory.

#### Wrong UID

Your program runs, but after a couple of seconds, you get a rather large error message with this line at the end?&#x20;

```
tinkerforge.ip_connection.Error: Did not receive response for function 255 in time (-1)
```

This usually means that you entered a wrong UID in your `constants.py` and the program can't connect to the LED. Double-check your LED's UID using the Brick Viewer, and correct any misspellings.

## Turning The LED Off Again

If we end the program after turning the LED to green, the LED remains in that state, even after the program has finished. This is because we haven't told it to do otherwise. Let's change our program so that it keeps the LED in the green-colored state until the user presses ENTER on the keyboard. Then, the program should turn the LED off and exit the program.

### Getting Input From The Keyboard

Asking the user for input is a common task in programming. In Python, we can prompt the user for input from the keyboard using the function with the same name:

```python
input("Please hit ENTER to turn off the LED and exit the program")
```

If you add this line at the end of your program, it won't exit unless you hit a key. Since a program is executed from top to bottom, we can place the code to turn the LED off directly behind the input prompt:

```python
led.set_rgb_value(0, 255, 0)
```

Why does this switch the LED off? As you will learn later, the RGB code with all parts set to zero encodes the color black. This effectively emits no light from the LED and thus turns it off.

## Asking For The Current Color

Imagine that we don't want to set the LED's color to an absolute value, but we rather wish to increase the redness of the LED's light. Make it a bit warmer. In this case, we need to know the current value for the LED's redness to add, let's say, 10% intensity to it. We can ask the LED for its current color setting like this:

```python
current_rgb = led.get_rgb_value()
```

But what exactly does the variable `current_rgb` contain at this point? We can find out by printing the variable's content to the console:

```python
print(current_rgb)
# Output: RGBValue(r=0, g=255, b=0)
```

The value looks a bit strange, but it is nothing but an object containing the three fields `r`, `g`, and `b`. In Python, we can access an object's field using the dot-notation:

```python
redness = current_rgb.r
```

Now that we have the absolute value for the color's red part, we can add 10% with a simple expression:

```python
increased_redness = redness * 1.1
```

Because the RGB code can only have whole numbers, also called <mark style="background-color:green;">**integers**</mark>, we should round the result from the expression:

```python
increased_redness = round(redness * 1.1)
```

We can then use this new value for the LED, leaving all other parts as they were:

```
led.set_rgb_value(increased_redness, current_rgb.g, current_rgb.b)
```

Note that this doesn't have any effect if the red part was 0 because if we increase zero by 10%, we still have nothing.

## Actuators and Sensors

In the LiFi project, we are creating a <mark style="background-color:green;">**cyberphysical system**</mark>. This type of system is based on software and operates in the digital world, but it also interacts with the analog world through physical hardware. The hardware in a cyberphysical system can be classified into two types: <mark style="background-color:green;">**sensors**</mark> and <mark style="background-color:green;">**actuators**</mark>, depending on their function.

Sensors convert energy from the analog world into digital form so that it can be processed by a computer. For example, the color sensor used in the LiFi project is equipped with photodiodes that are sensitive to photons. When a photon hits a photodiode, it creates a current that is measured and converted into a digital representation using an analog-to-digital converter (ADC). Unlike the analog world, which allows for any value, the digital world is limited to a discrete set of values.

Actuators work in the opposite way. They take a discrete set of values, convert them into analog format, and release them as energy. An LED is an example of an actuator. It receives one of the roughly 16 million color values that the RGB code can represent and converts it into an electromagnetic wave with the appropriate frequency for that color. Other examples of actuators include servos and motors that create physical movement in the analog world, and speakers that produce sound waves in the air.

The OLED display is another type of actuator, although it may be less obvious. In the LiFi project, it will display information in the form of light. By using sensors and actuators in combination, a cyberphysical system can interact with the physical world and achieve its intended purpose.

<img src="../.gitbook/assets/file.excalidraw (1).svg" alt="The LED is an actuator because it acts in the analog world by emitting photons." class="gitbook-drawing">

## The Light-Emitting Diode (LED)

In this section, you learned how to program an LED to light up or turn off. Let's take the chance and learn a <mark style="background-color:green;">**bit**</mark> (no pun intended) about how the LED works.

<mark style="background-color:green;">**LED**</mark> is the abbreviation for <mark style="background-color:green;">**light-emitting-diode**</mark>. It produces light when current flows through a sandwich of semiconductor materials. The material on the one side of the sandwich is altered such that at some locations, electrons are missing and so-called electron-holes are created. This side is called the p-type region, because of its positive charge due to the lack of electrons. The material on the other side, which is called the n-type region, has been altered in the opposite way. Here, there is an excess of free electrons, hence the name n-type (negative). When electric current is applied (turning the LED on), the semiconductor materials turn into conductors and the free electrons can travel to the other side and fill the holes. When that happens, energy is released in the form of photons - or light.

The color of the light has to do with the amount of energy that is being released when the holes are filled. Changing the characteristics of the semiconductors by adding small parts of other materials, or by adding extra layers, an LED can be created that emits light in a specific color.

## Further Reading

I recommend the following resources for further reading:

* Page 144/145 on "Electric Lighting" from the book _How Technology Works: The Facts Visually Explained._
* Pages 152/153 on "Digital cameras" from the book _How Technology Works: The Facts Visually Explained_.
* [The Wikipedia entry on the "Light-emitting diode"](https://en.wikipedia.org/wiki/Light-emitting\_diode)

Here is the link to the Python API documentation for the RGB LED:

* [Python API documentation for the RGB LED Bricklet 2.0](https://www.tinkerforge.com/en/doc/Software/Bricklets/RGBLEDV2\_Bricklet\_Python.html#rgb-led-v2-bricklet-python-api)

