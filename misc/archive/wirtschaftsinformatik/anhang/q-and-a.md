---
description: >-
  Hier findest du die gestellten Fragen und Antworten aus der Veranstaltung
  Wirtschaftsinformatik.
---

# Q & A

## #1 Bits

#### Wie wichtig werden das Oktal- und das Quartalsystem sein?

Ihr solltet Zahlensysteme _verstanden_ haben, dann ist es eigentlich egal, welches Zahlensystem. Das Prinzip ist immer das Gleiche.

#### Zu den Codes: Wir haben ja z.B. errechnet, dass für die Ermittlung eines deutschen Autokennzeichens 38 bits benötigt werden. Wo ist da der Zusammenhang zu den logic gates? Benötige ich dann 38 gates?

Nein. Die Logic Gates benötigen wir im Zusammenhang mit der _Verarbeitung_ (z.B. Addieren von zwei Zahlen). Bei der Aufgaben mit den KFZ-Kennzeichen geht es um die Frage, wie viele Bits wir für die _Speicherung_ (oder Übertragung) benötigen. Die Antwort 38 bedeutet, wir brauchen 38 Nullen und Einsen, um ein Deutsches Autokennzeichen zu codieren.

**Können Sie noch einmal erklären, was mit der Substratunabhängigkeit der Informationsverarbeitung gemeint ist?**

Das Thema Substratunabhängigkeit der Informationsverarbeitung ist im Text "What is Computation?" von Max Tegmark sehr gut und relativ ausführlich erklärt.

## 2# Digitalisierung

#### Warum hat ein 56k Modem immer dieses äußerst nervige Geräusch beim einwählen ins Internet gemacht?

Das hat damit zu tun, dass sich das Modem über die Telefonleitung mit einer Nummer einwählt (und dabei auch die Leitung belegt). Wer es genauer wissen möchte, Details zu den einzelnen Tönen sind hier beschrieben:

* [http://www.windytan.com/2012/11/the-sound-of-dialup-pictured.html](http://www.windytan.com/2012/11/the-sound-of-dialup-pictured.html)

## #3 Algorithmen

### Können Sie für jede Komplexitätsklasse ein Beispiel nennen?

| Komplexitätsklasse | Beispiel                                                                                       |
| ------------------ | ---------------------------------------------------------------------------------------------- |
| $$O(1)$$           | Ein neues Element einer Warteschlange (Queue) hinzufügen.                                      |
| $$O(log~n)$$       | Binäre Suche.                                                                                  |
| $$O(n)$$           | Lineare Suche, Vergleich zweier Strings.                                                       |
| $$O(n~log~n)$$     | Bestimmte Sortieralgorithmen wie Merge Sort oder Quick Sort.                                   |
| $$O(n^2)$$         | Bestimmte Sortieralgorithemn wie Selection Sort oder Bubble Sort, Durchlaufen eines 2D-Arrays. |
| $$O(n^3)$$         | Durchlaufen eines 3D-Arrays.                                                                   |
| $$O(2^n)$$         | Rekursive Berechnung einer Fibonacci-Zahlenfolge.                                              |
| $$O(n!)$$          | Alle Lösungen des Traveling Salesman Problem probieren.                                        |

## Course Logistics

#### Werden die Quizze auch benotet oder dienen sie nur der Selbstkontrolle?

Nur Selbstkontrolle. Die Antworten sind völlig anonym, so dass es auch keine Möglichkeit der Zuordnung gibt.

#### Wie ist der prozentuale Anteil Englisch / Deutsch im Modul?

Die Sessions sind auf Deutsch. Die Folien und Materialien sind gemischt Deutsch und Englisch. Die Prüfung ist auf Deutsch.

#### Wo finde ich die Texte?

Die Texte sind nur für eingeloggte Benutzer in OSCA zugreifbar. Ich lade die Texte als PDF in den Dateibereich hoch.

#### Gibt es zu den Übungsaufgaben Musterlösungen?

Nein, ich stelle keine Musterlösungen bereit. Wenn ihr Lösungen erstellt und z.B. via Slack einreicht, verspreche ich Euch aber ein Feedback. Wenn wir Zeit haben besprechen wir die Lösung auch in der Sitzung.

#### Kannst du die Zeichnungen aus der Sitzung hochladen?

Nein, die Zeichnungen sind nur für während der Sitzung gedacht. Die sind zu unstrukturiert, als dass ich sie euch zu Verfügung stellen könnte. Da könnte mehr Verwirrung aufkommen als notwendig. Ich biete euch aber an, dass wir gerne auf bestimmte Fragen zur Aufgabe noch einmal eingehen. Dann bitte konkrete Frage über das Q\&A stellen.

**UPDATE**: Ich werde versuchen bei Übungsaufgaben darauf zu achten, die Zeichnungen so zu gestalten, dass ich sie im Anschluss in Slack hochladen kann.

#### Ich finde den Aufbau und die Präsentation der Vorlesung sehr gelungen. Nur das Quiz am Anfang der Vorlesung, würde meiner Meinung nach, am Ende der Vorlesung mehr Sinn ergeben.

Danke für das Feedback. Die Idee bei dem Quiz ist es, den Wissensstand bezüglich der Texte, die zur Vorbereitung gelesen werden sollten, zu erheben. Deshalb machen wir das direkt zu Beginn. Generell finde ich die Idee eines Quiz am Ende auch gut, um das Gelernte zusammenzufassen. Das würde ich z.B. machen, wenn es keine Texte zur Vorbereitung gab.
