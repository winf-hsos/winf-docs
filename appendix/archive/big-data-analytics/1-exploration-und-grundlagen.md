---
description: In diesem Block geht es um wichtige grundlegende Fragen zu Big Data.
---

# #1 Big Data Grundlagen

## :dart: Lernziele

* :dart: Ihr könnt Big Data von herkömmlichen Daten anhand wichtiger Charakteristika abgrenzen.
* :dart: Ihr kennt die Herausforderungen die Big Data mit sich bringt.
* :dart: Ihr kennt die wichtigsten Lösungsansätze für diese Herausforderungen.

## :question: Fragen

* :question:Was charakterisiert Big Data?
* :question:Vor welche Herausforderungen stellt uns Big Data?
* :question:Warum funktionieren traditionelle Lösungsansätze mit Big Data nicht?
* :question:Welche Lösungsansätze gibt es, um diesen Herausforderungen zu begegnen?

## :label: Begriffe

* :label: Die 3 Vs
  * :label:Volume
  * :label:Variety
  * :label:Velocity
* :label:Polystrukturierte Daten\

* :label:Distributed Filesystem and Processing
* :label:Cluster
* :label:HDFS
* ​ :label:MapReduce
  * ​​ :label:Data Node
  * ​​ :label:Worker Node
  * ​​ :label:Name Node\

* :label:Apache Spark
  * :label: RDD
  * :label: Spark Transformations und Actions

## :key: Key Points

* :key: Eine verbreitete Option, Big Data zu klassifizieren, ist die Orientierung an den **3 Vs**:
  * Volume = Datenmenge
  * Variety = Datenvielfalt
  * Velocity = Frequenz der Daten(-erzeugung)\

* :key: Die 3 Vs stellen uns vor neue Herausforderungen:
  * **Volume**: Einzelne Rechner können große Datenmengen im Terabytebereich oder größer nicht mehr speichern oder in angemessener Zeit analysieren.
  * **Variety**: Traditionelle relationale Datenbanken oder Spreadsheets eignen sich nicht für polystrukturierte Daten wie Texte, Bilder oder Dokumente, weil diese entweder keine inhärente Struktur haben (Texte, Bilder) und/oder weil sie keinem starren Schema in Sinne von Spalten und Werten folgen.
  * **Velocity**: Daten werden oft in schneller Frequenz erzeugt, z.B. Sensordaten oder Social Media Daten. In vielen Szenarien ist die zeitnahe Analyse der Daten zwingend notwendig, man spricht dann auch von _real-time_ oder _near real-time_. Die schnelle Verarbeitung und Analyse von großen Datenmengen stellt einzelne Rechner und traditionelle Datenbanken (z. B. relationale Datenbank) vor Probleme.\

* :key: Ein Lösungsansatz für das Speichern großer Datenmengen ist das Verteilen der Daten auf einen _Verbund_ von Rechnern (:label:Cluster), statt auf nur einem Rechner. Man spricht dann von einem verteilten Dateisystem (:label:Distributed Filesystem). Ein weit verbreitetes System ist das :label:HDFS (Hadoop Distributed Filesystem), das große Dateien in kleinere Blöcke aufteilt, die dann mehrfach redundant auf mind. 3 Knoten im :label:Cluster abgelegt werden.\

* :key: Die Verteilung der Arbeitslast auf mehrere Knoten (_nodes_) ist auch der wichtigste Ansatz bei der Verarbeitung von Big Data. Dabei wird das Problem oder die Abfrage in parallel verarbeitbare Teilprobleme zerlegt und auf die verfügbaren Knoten verteilt. Jedes Teilergebnis wird eingesammelt und zu dem Gesamtergebnis aggregiert. Bekannte Verfahren für das verteile Verarbeiten von Daten ( :label:Distributed Processing) sind das von Google entwickelte :label:MapReduce oder :label:Apache Spark. \

* :warning: Nicht alle Probleme lassen sich in unabhängig voneinander lösbare Teilprobleme zerlegen!
