# Tinkerforge Device Manager

In some of my modules and related projects, we work with electronic devices, such as sensors and actuators. With theses devices, we learn to program and build small applications, such as a sensor-based greenhouse control system.

The devices we use are from a German company called [Tinkerforge](https://www.tinkerforge.com/en/). Tinkerforge offers a variety of parts that we can assemble and program to build our application prototypes. To glue the parts together, we program a piece of software using their Javascript Application Programming Interface (API).

On top of their native Javascript API, I built an additional layer of abstraction, which makes it easier for us to connect to and handle the different devices. In this tutorial, you'll learn how to use the [Tinkerforge Device Manager](https://github.com/winf-hsos/tinkerforge-device-manager-web).

### Use the Template

If you want to get started right away, remix the Glitch project below. It includes all necessary imports:

{% embed url="https://glitch.com/~digitalization-hsos-coding-template" %}

### Manual Import

You can manually include all necessary libraries to use the TDM in your web project. If you want to do that, follow theses steps:

1. Download the latest version of the [Tinkerforge Javascript API](https://www.tinkerforge.com/de/doc/Downloads.html#downloads-bindings-examples).
2. Unzip the file and navigate to "Browser/Source". Copy the file `Tinkerforge.js` into your project under the folder `lib/`.
3. Copy the 3 lines of code below and paste them right _before_ the closing `</body>`-tag in your HTML file.

{% code title="index.html" %}
```markup
<script src="lib/Tinkerforge.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.24.0/moment.min.js" type="text/javascript"></script>
<script
    src="https://cdn.jsdelivr.net/gh/winf-hsos/tinkerforge-device-manager-web@0.1.8/index.js"
    type="module">
</script>
```
{% endcode %}
