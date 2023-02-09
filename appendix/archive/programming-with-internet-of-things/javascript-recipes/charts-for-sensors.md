---
description: >-
  Visualizing sensor data in real-time can be a nice feature in every IoT
  application. This recipe shows you how to integrate a line chart with chart.js
---

# Charts for Sensors

## Load chart.js from web source

The easiest way to integrate the [chart.js](https://www.chartjs.org/) library in our prototypes is to use a link from a content delivery network (CDN):

```markup
<!-- Import chart.js via CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<!-- Import your own JS after you load chart.js -->
<script src="chart.js" type="text/javascript" defer></script>
```

{% hint style="warning" %}
Make sure you load your own Javascript file after the call to the CDN, as seen above.
{% endhint %}

## Add a canvas element in your HTML file

Place a `<canvas>` element somewhere in your HTML file within your the body of your document:

```markup
<canvas id="chart"></canvas>
```

This element will later contain the chart. The `<canvas>` element is a generic element to draw on, and chart.js is using it to draw the chart. You'll pass the id of the `<canvas>` element to chart.js in the next step.

## Initialize the chart

```javascript
// Get the canvas element from your HTML
var ctx = document.getElementById("chart").getContext("2d");

// Initialize a new line chart with empty data
// The data will be added through a sensor later on
var chart = new Chart(ctx, {
  // The type of chart we want to create
  type: "line",

  // The data for our only dataset
  data: {
    labels: [],
    
    // We can have more than one data set (or series)
    datasets: [
      {
        label: "Temperature in °C",
        backgroundColor: "#7db414",
        borderColor: "#7dc424",
        data: []
      }
    ]
  },

  // Configuration options go here
  options: {}
});
```

## Add data to the chart

In this example, we'll add a new random data point to our chart every second. So at first, we set a new timer interval using `setInterval()`:

```javascript
// Add a new point every second
setInterval(addPoint, 1000);
```

Next, we implement the `addPoint()` function, which is called every second by the interval:

```javascript
// The example counts 1 up for every new label
var currentLabel = 1;

function addPoint() {
  addData(chart, currentLabel++, Math.random() * 10);
}
```

As our labels, we simply start at one and increment the label by one for every new random data point. For this we use the variable `currentLabel`. For our data point, we draw a random value between 0 and 10 using `Math.random()`. To actually add the data point and the label to our chart, we call `addPoint()` function:

```javascript
// How many value should be displayed in the chart?
var maxLength = 10;

function addData(chart, label, data) {

  // Get the current label and data array from our chart    
  let chartLabels = chart.data.labels;
  let chartData = chart.data.datasets[0].data;
  
  // Remove first data item if max length is reached
  if (chartData.length == maxLength) {
    chartLabels.shift();
    chartData.shift();
  }

  // Add the new label and corresponding data
  chartLabels.push(label);
  chartData.push(data);

  // Update the chart
  chart.update();
}
```

To limit the number of data points we want to show in our chart, we introduce the variable `maxLength`. This variable defines the maximum number of points we want to show. When this number is exceeded, we remove the first label and corresponding data point with the array function `shift()` in line 12 and 13.

In line 17 and 18 we add the new label and the data that was passed as an argument of the function to our chart's arrays. To reflect the new data point in our live chart, we call `chart.update()` at the end of the function.
