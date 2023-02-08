---
description: >-
  Mit Javascript bringen wir Leben in unsere Webseite. Wir geben Buttons eine
  Funktion, laden Daten im Hintergrund, oder verändern Teile der Webseite
  nachdem sie geladen wurde.
---

# Websites & Javascript

## HTML mit JavaScript verändern

JavaScript erlaubt es uns, den HTML-Baum und all seine Attribute nach dem Laden der Webseite zu verändern. Damit kann z.B. das Hinzufügen oder Löschen von HTML-Elementen gemeint sein. Aber auch das bloße Ändern des (Text-) Inhalts oder Attributwerten.

### Textinhalt verändern

#### HTML

Vergebt im HTML eine ID für ein HTML Element, das ihr mit JavaScript manipulieren wollt.

{% code title="index.html" %}
```markup
<p id="one"></p>
```
{% endcode %}

#### JavaScript

Verwendet die Funktion `document.querySelector()`, um euch mit JavaScript Zugriff auf das Element zu verschaffen. Nutzt anschließend `textContent` oder `innerHTML`, um den Inhalt des Elements zu setzen.

{% code title="script.js" %}
```javascript
var pElement = document.querySelector("#one");
pElement.textContent = "This text is set with JS";

// Instead of text use HTML like this
pElement.innerHTML = "This <tt>text</tt> is set with <b>JS</b>";
```
{% endcode %}

### CSS Klassen hinzufügen

#### HTML

Vergebt im HTML eine ID für ein HTML Element, das ihr mit JavaScript manipulieren wollt.

{% code title="index.html" %}
```markup
<p id="one"></p>
```
{% endcode %}

#### JavaScript

Die Eigenschaft `classList` gibt euch Zugriff auf die CSS-Klassen.

{% code title="script.js" %}
```javascript
var pElement = document.querySelector("#one");

// Add a CSS class
pElement.classList.add("green");

// Remove a CSS class
pElement.classList.remove("green");
```
{% endcode %}

### Elemente anzeigen und verstecken

{% code title="script.js" %}
```javascript
// Hide the sign-up form
document.querySelector('#signupForm').setAttribute("hidden", "");

// Unhide (show) the signup-form
document.querySelector('#signupForm').removeAttribute("hidden");
```
{% endcode %}

## Arrays

Sortierte Listen - oder Arrays - begegnen uns häufig im Zusammenhang mit dem Lesen von Daten aus der Firestore-Datenbank. Deshalb ist es wichtig, dass wir die gängigsten Operationen mit Arrays in JavaScript kennen und anwenden können.

### Alle Elemente eines Arrays durchlaufen

{% code title="script.js" %}
```javascript
// Reading a Firestore collection like this results in an array with 
// all documents.
firebasetools.getContentItems("todos", todosReady);

// This callback-function is called with the todos
function todosReady(todosArray) {
    
    // We can use a FOR-loop to iterate all todos
    for(var i = 0; i < todosArray.length; i++) {
        console.dir(todosArray[i]);
    }
}
```
{% endcode %}

### Arrays sortieren

{% code title="script.js" %}
```javascript
// Suppose we have the array of todos from the example above
// Each element in the array has a field "name"

// Sort by the field "name" ascending
firebasetools.sortArrayBy(todosArray, "name");

// Sort by the field "name" descending
firebasetools.sortArrayBy(todosArray, "name", true);
```
{% endcode %}

## Data Attribute

#### HTML

{% code title="index.html" %}
```markup
<p id="one" data-id="1" data-author="Michael"></p>
```
{% endcode %}

#### JavaScript

{% code title="script.js" %}
```javascript
// Access data attributes via the .dataset collection
var elementId = document.querySelector("#one").dataset.id;

// Change the value of an existing data attribute
document.querySelector("#one").dataset.author= "Gordon";

// Set new data attributes
document.querySelector("#one").dataset.title = "Introduction to JavaScript";
```
{% endcode %}

Mehr zu Data-Attributen findet ihr u.a. auf der MDN Dokumentationsseite:

{% embed url="https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/data-*" %}
