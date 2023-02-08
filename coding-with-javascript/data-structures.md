# Data Structures

## Literal Values

## Lists

* Array = Sorted and indexed list
* Set = Unique values

## Dictionaries

## Queues and Stacks

A queue and stack are two special cases of a sorted list (or array) with specific policies on how to add and remove items:

```javascript
var stack = [];
stack.push(2);       // stack is now [2]
stack.push(5);       // stack is now [2, 5]
var i = stack.pop(); // stack is now [2]
log(i);              // displays 5

var queue = [];
queue.push(2);         // queue is now [2]
queue.push(5);         // queue is now [2, 5]
var i = queue.shift(); // queue is now [5]
log(i);                // displays 2
```
