---
description: >-
  A simple countdown timer with start, stop, and restart functionality to
  display on your web app.
---

# Countdown Timer

## Add the elements to the website

For the timer example, we add a progress bar along with 3 buttons to set, start and stop the timer. Additionally, we add an input field to enter the seconds the timer should be set to. Note that we give the progress bar the `id="timer"`, so that we can reference it from our Javascript code below.

The [progress bar](https://getbootstrap.com/docs/4.5/components/progress/), the [input field](https://getbootstrap.com/docs/4.5/components/forms/), and the [buttons](https://getbootstrap.com/docs/4.5/components/buttons/) are part of [Bootstrap](https://getbootstrap.com/) and are ready to use as they are.

```markup
<!-- Elements for the timer -->
<h2>
  Coffee Timer
</h2>

<div class="progress mt-4 mb-4">
  <div
    id="timer"
    class="progress-bar progress-bar-striped progress-bar-animated"
    role="progressbar"
    style="width: 0%"
  ></div>
</div>

<input type="text" class="form-control mb-4" id="setTimerTo" />

<!-- Buttons for the timer -->
 <button class="btn btn-secondary mt-2" onclick="setTimer()">
  Set
</button>

<button class="btn btn-secondary mt-2" onclick="startTimer()">
  Start
</button>

<button class="btn btn-secondary mt-2" onclick="stopTimer()">
  Stop
</button>
```

## Wiring the buttons

### Global variables

For the timer to work, we'll need 3 global variables: The `timerStartedAt` keeps track of what the initial time in seconds was when the timer was started. The variable `timer` keeps track of the current remaining time in seconds and is decreased every second once the timer was started. The variable `timerInterval` holds a reference to the automatic interval that executes every second. We need this reference to stop the interval when someone clicks "Stop".

```javascript
var timerStartedAt;
var timer = 0;
var timerInterval;
```

### Set the timer

To set the timer to a specific value, we connect the button to a function called `setTimer()`, which is implemented as follows:

```javascript
function setTimer() {
  // Get the value from the input field for the time in seconds
  var setTimerTo = document.querySelector('#setTimerTo').value;
  
  timerStartedAt = setTimerTo;
  timer = setTimerTo;
  
  // Stop the timer initially
  stopTimer();
  
  // Set progress bar to 100%
  document.querySelector('#timer').style.width = "100%";
  
  log("Timer set to " + setTimerTo + " seconds. Hit start to countdown.");
}
```

In line 3, we retrieve the value the user has entered. We interpret this value as duration in seconds the timer should count down. When the timer is set, we initialize the two variables `timerStartedAt` and `timer` (time left) with this value. No time has passed yet.

To clear any existing intervals if a timer is currently running, we call `stopTimer()` in line 9.

In line 11, we set the progress bar to 100%, which makes it blue all the way. Since the timer is counting down, the progress bar will become smaller over time instead of bigger.

![The timer is initialized with 100% width when the timer is set.](<../../../../.gitbook/assets/image (2).png>)

Finally, we log the information that the timer was set to the console (line 14).

### Start the timer

To start the timer, we wire the `startTimer()` function to the corresponding button. The function looks a follows:

```javascript
function startTimer() {
  timerInterval = setInterval(decreaseTimer, 1000);
}
```

The only thing that happens here is the initialization of a 1 second interval that executes the function `decreaseTimer()` every second (1000 ms = 1 second). We store a reference to the interval on the variable `timerInterval`.

The function `decreaseTimer()` looks as follows and takes care of decreasing the timer and updating the progress bar:

```javascript
function decreaseTimer() {
  timer = timer - 1;
  
  if(timer <= 0) {
    stopTimer();

    // Call a function to indicate the timer fires
    timerDone();
  }
  
  // Calculate the relative value
  var progress = Math.round(timer / timerStartedAt * 100);
  
  // Update the progress bar
  document.querySelector('#timer').style.width = progress + "%";
}

```

We first decrease the timer by one in line 2. We then check whether the timer is still greater than zero. If not, we call `stopTimer()` and `timerDone()`. In the latter, we output a message to the console indicating the coffee is ready:

```javascript
function timerDone() {
  log("Time is up! Get your coffee!");
}
```

In line 12 of the `decreaseTimer()` function, we transform the current progress of the timer to a scale between 0 and 100, because that is the number we need for the progress bar. Afterwards, we assign the new width of the progress bar, so that we get an visual update.

![](../../../../.gitbook/assets/coffee\_timer.gif)

### Stop the timer

To pause the timer, the user can click on "Stop" at any time. To resume the user can click "Start" again.
