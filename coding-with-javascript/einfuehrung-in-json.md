# The JSON Format

## Lernziele

In diesem kurzen Tutorial bekommt ihr einen Überblick über das **Javascript Object Notation Format**, kurz JSON genannt.

## Was ist JSON?

JSON ist ein Datenformat für komplexe Daten, das oft für Austausch von Daten im Internet verwendet wird. Ein JSON-Objekt erlaubt es, nicht nur atomare Werte wie eine Zahl, eine Zeichenfolge oder ein Datum zu speichern, sondern kann gleich beliebig viele dieser atomare Werte enthalten. Jeder Wert wird dabei als ein _Property_ bezeichnet und besitzt einen Namen. Ein einfaches Beispiel verdeutlicht das:

```javascript
{
    "name": "Mark",
    "lastName": "Zuckerberg",
    "year_of_birth": 1984 
}
```

Wie das Beispiel zeigt ist ein JSON-Objekt immer von geschweiften Klammern umgeben. Die Zeilenumbrüche und Einrückungen haben nichts mit dem Format zu tun und dienen nur der besseren Lesbarkeit. Wir könnten auch einfach alles in einer Zeile schreiben, können es dann aber nicht mehr gut lesen:

```javascript
{ "name": "Mark", "lastName": "Zuckerberg", "year_of_birth": 1984 }
```

_Properties_ sind stets Paare aus Namen (oder _Keys_) und Werten (oder _Values_). Der Name eines _Property_ steht dabei immer in doppelten Anführungszeichen. Getrennt mit einem Doppelpunkt folgt der Wert. Dieser steht ebenfalls in Anführungszeichen, wenn es sich um eine Zeichenfolge handelt. Ist der Wert aber eine Zahl, wie im Beispiel des Geburtsjahres, dann brauchen wir keine Anführungszeichen zu setzen. Mehrere _Properties_ werden durch Kommata voneinander getrennt.

Neben Ganzzahlen und Zeichenfolgen (_Strings_) gibt es noch weitere primitive Datentypen:

```javascript
{
    "name": "Mark",
    "lastName": "Zuckerberg",
    "year_of_birth": 1984,
    "male": true,
    "height": 171.4
}
```

Das Property `"male"` hat den Datentyp _Boolean_, was bedeutet, dass der Wert entweder wahr (`true`) oder falsch (`false`) sein darf. Auch hier benötigen wir keine Anführungszeichen.

Das Property `"height"` ist wie das Geburtsjahr eine Zahl, in diesem Fall aber keine Ganzzahl, sondern eine Dezimalzahl. D.h. sie besitzt Nachkommastellen, die durch den Dezimalpunkt getrennt ausgewiesen werden. Hier sprechen wir vom Datentyp _Double_ oder _Float_. Auch hier brauchen wir keine doppelten Anführungszeichen.

Häufig sehen wir auch noch einen weiteren Datentyp, der aber streng genommen im JSON-Format kein eigener Datentyp ist:

```javascript
{
    "dateOfBirth": "1984/05/14"
}
```

Inhaltlich handelt es sich um ein Datum, technisch ist es aber eine Zeichenfolge wie jede andere auch. Um mit Datumswerten in JSON zu arbeiten, muss das genaue Format bekannt sein. Z.B. könnte man das gleiche Datum auch als `"1984-14-05"` oder `"14.05.1984"` formatieren. Nur wenn man das genaue Format kennt kann man es z.B. mit SQL in ein Datum überführen.

## Objekte

Die oberste Strukturebene im JSON-Format ist immer ein so genanntes Objekt. Objekte erkennen wir an den geschweiften Klammern. Wir haben oben gesehen, dass ein Objekt mehrere _Properties_ haben kann, die Werte vom Typ Zeichenfolge, Ganzzahl, Dezimalzahl, Wahr/Falsch oder auch Datum haben können. Ein _Property_ kann aber auch ein weiteres Objekt als Wert haben. Das führt zu einer Baumstruktur.

```javascript
{
    "name": "Mark",
    "lastName": "Zuckerberg",
    "year_of_birth": 1984,
    "company": {
        "name": "Facebook",
        "url": "https://facebook.com"
    }
}
```

Schaut euch das Feld `"company"` im obigen Beispiel an. Der Wert, der nach dem Doppelpunkt folgt, ist ein weiteres Objekt, wie wir an den geschweiften Klammern erkennen können. Das neue Objekt besitzt zwei Felder `"name"` und `"url"`, die jeweils atomare Werte vom Typ Zeichenkette haben.&#x20;

Aber auch das muss nicht sein, sondern wir könnten auch hier ein _Property_ mit einem weiteren Objekt finden:

```javascript
{
    "name": "Mark",
    "lastName": "Zuckerberg",
    "year_of_birth": 1984,
    "company": {
        "name": "Facebook",
        "url": "https://facebook.com",
        "address":  {
            "street": "1 Hacker way",
            "zip": 94025,
            "city": "Menlo Park"
        }
    }
}
```

Ein JSON-Objekt kann beliebig tief geschachtelt sein, was das Format sehr flexibel macht.

## Arrays

Neben atomaren Werten und Objekten existiert in JSON noch ein weiteres Typ für ein Property: Das Array. Ein Array ist eine sortierte Liste von Werten. Mit sortiert meinen wir, dass jedes Element in der Liste eine genaue Position hat, die wir über eine Zahl benennen können (das erste, das zweite, ... das letzte).&#x20;

Schauen wir uns ein Beispiel an:

```javascript
{
    "name": "Mark",
    "lastName": "Zuckerberg",
    "year_of_birth": 1984,
    "siblings": [
        "Randi Zuckerberg",
        "Arielle Zuckerberg",
        "Donna Zuckerberg"
    ]
}
```

Im Beispiel oben ist das Property `"siblings"` eine Liste von Zeichenketten. Das erste Element der Liste ist `"Randi Zuckerberg"`, das zweite `"Arielle Zuckerberg"` und das dritte ist `"Donna Zuckerberg"`. Jedes Element hat den primitiven Datentyp String (oder Zeichenkette). Wir ihr sicher schon erraten habt, kann aber in einem Array auch ein Objekt stehen:

```javascript
{
   "lastName": "Zuckerberg",
    "year_of_birth": 1984,
    "siblings": [
        { "name": "Randi Zuckerberg", "gender": "f" }, 
        { "name": "Arielle Zuckerberg", "gender": "f" },
        { "name": "Donna Zuckerberg", "gender": "f" }
    ]
}
```

Nun hat die Liste `"siblings"` immernoch 3 Elemente, diese sind aber jetzt vom Typ Objekt und haben wiederum eigene _Properties_. Diese Verschachtelung lässt sich beliebig fortführen.

## Flexible Struktur

Das JSON-Format wird häufig als ein Beispiel für ein semi-strukturiertes Format verwendet. Aus den obigen Beispielen würden wir ableiten, dass ein JSON-Objekt stets eine sehr klare Struktur hat, da zumindest in den Beispielen jederzeit bekannt ist, welche Properties existieren und welche Art von Wert darin steht. Wir könnten aber auch ein solches Beispiel verwenden, was auch ein valides JSON-Objekt ist:

```javascript
{
   "lastName": "Zuckerberg",
    "year_of_birth": 1984,
    "siblings": [
        { "name": "Randi Zuckerberg", "age": 37 }, 
        { "name": "Arielle Zuckerberg", "gender": "f" },
        { "name": "Donna Zuckerberg", "gender": "f", "married": true }
    ]
}
```

Wenn ihr euch nun die Geschwister anschaut seht ihr, dass sie nicht alle die selben Properties besitzen. "Randi" hat das Property `"age"`, was die beiden anderen nicht haben. Dafür hat "Randi" kein Property `"gender"`. "Donna" hat das zusätzliche Property `"married"`, die anderen beiden aber nicht.

Dieser Zustand ist im JSON-Format erlaubt und sogar gewollt. JSON-Objekte sind Dokumente, die keinem starren Schema folgen, und das macht sie so flexibel im Web einsetzbar.&#x20;

Ein Problem beim Einsatz relationaler Datenbanken für das Speichern von z.B. Profilen oder Beiträgen in Social Media Netzwerken war, dass diese ein ex ante definiertes Schema erwarten. Es müssen sämtliche zu speichernde Werte vorher als Spalten definiert worden sein, und nachträgliche Änderungen an diesem Schema sind sehr kostspielig. Gerade im sich schnell verändernden Web-Umfeld ist es aber unmöglich, alle Informationen vorher zu kennen. Es treten ständig Änderungen auf, z.B. wenn man eine neue Information bezüglich eines Benutzers abspeichern möchte. Für das JSON-Format stellt das kein Problem dar, weil nicht jedes Dokument genau die gleiche Struktur haben muss wie alle anderen.

## :link: Links

* :link: [Offizielle Seite des JSON-Formats](https://www.json.org/)
