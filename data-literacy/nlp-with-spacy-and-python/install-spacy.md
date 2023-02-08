---
description: >-
  Zuerst schauen wir uns an, wie wir das Python-Modul spaCy installieren können,
  um es anschließend in Databricks oder in unserer lokalen Python-Umgebung
  verwenden zu können.
---

# Install spaCy

## Das Modul installieren

In einem Python Notebook in Databricks können wir auf die Kommandozeile mit `%sh` wechseln und anschließend das Modul mit dem `pip` Befehl installieren:

```bash
%sh
pip install spacy
```

## Die Modelle für verschiedene Sprachen installieren

Um spaCy mit einer bestimmten Sprache wie Deutsch oder Englisch verwenden zu können - also um Texte in dieser Sprache analysieren zu können - müssen wir noch die entsprechenden Modelle herunterladen. Die Modelle beinhalten u.a. Listen für Stopwörter. Aber auch statistische Modelle in Form von neuronalen Netzen, die auf genau eine bestimmte Sprache mit einem sehr großen Trainingsdatensatz trainiert wurden. Mit diesen Modellen können wir z.B. Entitäten erkennen, POS-Tagging vornehmen, syntaktische Analysen durchführen oder Ähnlichkeiten zwischen Wörtern oder Texten bestimmen.

spaCy bietet für sehr viele Sprachen Modelle an, die wir herunterladen und verwenden können. Im Folgenden sind die Modelle für Deutsch und Englisch aufgeführt. Für jede der beiden Sprachen gibt es Modelle unterschiedlicher Größe. Der Unterschied zwischen den Modellen ist die Informationsmenge und die zugrunde liegenden Trainingsdaten - kleinere Modelle sind schneller und verwenden weniger Speicherplatz, sind dafür aber tendenziell ungenauer.

### Modelle für Englische Texte

```bash
%sh
# Kleines Modell (small) (11 MB)
pip install "https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-2.2.0/en_core_web_sm-2.2.0.tar.gz"

# Mittleres Modell (medium) (91 MB)
pip install "https://github.com/explosion/spacy-models/releases/download/en_core_web_md-2.2.5/en_core_web_md-2.2.5.tar.gz"

# Großes Modell (large) (789 MB)
pip install "https://github.com/explosion/spacy-models/releases/download/en_core_web_lg-2.2.5/en_core_web_lg-2.2.5.tar.gz"
```

### Modelle für Deutsche Texte

Für die Deutsche Sprache stehen nur 2 Modellgrößen zur Verfügung:

```bash
%sh
# Kleines Modell (small) (14 MB)
pip install "https://github.com/explosion/spacy-models/releases/download/de_core_news_sm-2.2.5/de_core_news_sm-2.2.5.tar.gz"

# Mittleres Modell (medium) (214 MB)
pip install "https://github.com/explosion/spacy-models/releases/download/de_core_news_md-2.2.5/de_core_news_md-2.2.5.tar.gz"
```

Das war es schon, wir können im nächsten Schritt ein vorher heruntergeladenes Modell auf Texte anwenden.
