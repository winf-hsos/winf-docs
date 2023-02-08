---
description: >-
  In diesem Block lernen wir die automatisierte maschinelle Analyse von Bildern
  kennen.
---

# #4 Analyse von Bildern

## :dart: Lernziele

* :dart: Ihr kennt die Bedeutung und wisst um den potenziellen Informationsgehalt von Bildern.
* :dart: Ihr kennt wichtige Methoden und Anwendungsfälle der maschinellen Bildanalyse (Computer Vision)
* :dart: Ihr wendet Cloud-Dienste an, um mithilfe von Machine Learning Modellen auf unstrukturierte Daten wie z.B. Bilder eine Struktur zu projizieren und sie somit für euch auswertbar zu machen.

## ****:question: **Fragen**

* :question: Für welche Anwendungsfälle kann es sinnvoll sein, Bilder zu analysieren?
* :question: Welche Informationen können Bilder beinhalten, die für Analysen interessant wären?
* :question: Welche Schritte sind typisch für die Analyse von Bildern?
* :question: Welche Möglichkeiten gibt, mittels Cloud-Diensten Informationen aus Bildern zu extrahieren?

## :label: Begriffe

* :label:Objekterkennung
* :label:Klassifizierung
* :label:Deep Learning

## :key: Key Points

* :key: Neben Texten nehmen auch Prävalenz von Bildern in den Online-Medien zu. Soziale Netzwerke wie Instagram oder Pinterest setzen gänzlich auf Bilder, während auch der Anteil bei Twitter oder Facebook steigt.\

* :key: Nicht nur in der Online-Welt kann es interessant sein, Bilder und deren Inhalte systematisch zu analysieren. Auch in anderen Bereichen gibt es Anwendungsfälle:\

  * Automatische Gesichtserkennung an Hot-Spots zur Verbrechensbekämpfung.
  * Positionserkennung von Produkten in der Fertigung, z.B. in der Lebensmittelindustrie.
  * Autonomes Fahren\

* :key: Das systematische und automatisierte Verarbeiten von Bildern war bis vor kurzem nicht möglich, da es keine effizienten Algorithmen für die Erkennung von Objekten auf Bildern gab. Klassische regelbasierte Verfahren scheiten an der Vielfalt von Objekten und bieten keine Lösung. Erst mit der Verbesserung der Verfahren maschinellen Lernens und spezielle künstlich neuronalen Netzen (:label:Deep Learning) wurde die Bilderkennung durch Maschinen ermöglicht. Mittlerweile übertreffen Maschinen uns Menschen in den meisten Disziplinen der Bilderkennung.\

* :key: Um Verfahren der Bilderkennung für eigene Anwendungen zu nutzen muss man heute kein Data Scientist mehr sein. Es existiert eine Vielzahl an Cloud-Diensten, die es erlauben, Bilder über eine Webservice-Schnittstelle hochzuladen und als Ergebnis eine Sammlung von Metadaten über jedes Bild zu erhalten. Diese Daten beinhalten u.a:\

  * Welche Objekte sind auf dem Bild zu sehen?
  * Wie kann man das Bild mit einem Satz beschreiben?
  * Sind Gesichter auf dem Bild zu sehen? Und wenn ja
    * Handelt es sich um eine Frau oder einen Mann?
    * Lächelt die Person? Oder schaut sie traurig?
    * Welche Haar-, Haut oder Augenfarbe hat die Person?
    * Wie alt die Person schätzungsweise?
    * Ist das Gesicht ein bekanntes Gesicht (Prominenz)?
  * Welche Marken, Logos etc. sind auf dem Bild zu sehen?

## :link: Links

* :link: [Object Detection - An overview in the age of deep learning](https://tryolabs.com/blog/2017/08/30/object-detection-an-overview-in-the-age-of-deep-learning/)
* :link: [BodyPix - Bodypart Recognition](https://github.com/tensorflow/tfjs-models/tree/master/body-pix)
* :link: [PoseNet - Real Time Pose Estimation](https://github.com/tensorflow/tfjs-models/tree/master/posenet)
* :link: [https://www.thispersondoesnotexist.com/](https://www.thispersondoesnotexist.com/)

{% embed url="https://luminoth.ai/" %}

{% embed url="https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/" %}

{% embed url="https://cloud.google.com/vision/?hl=de" %}

{% embed url="https://aws.amazon.com/de/rekognition/" %}
