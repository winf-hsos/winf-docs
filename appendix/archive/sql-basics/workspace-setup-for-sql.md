# Workspace Setup

## Databricks-Account erstellen

Databricks ist ein Cloud-Anbieter für Datenanalysen, unter anderem auf Basis von SQL. Databricks bietet einen kostenlosen Zugang über die so genannte Community Edition. Für die Teilnahme an diesem Tutorial müsst ihr euch ein kostenloses Databricks-Konto erstellen:

* Klickt auf [diesen Link](https://databricks.com/try-databricks), um auf die Anmeldeseite zu gelangen.\

*   Gebt euren Namen ein und füllt die restlichen Felder aus:

    * Company Name = University of Applied Sciences Osnabrück
    * Work Email = deine HS-Email-Adresse
    * Intended Use Case = Education - Teaching&#x20;
    * Your Role = Student


* Klickt auf den "Get Started" Button auf der **rechten Seite** (Community Edition).

{% hint style="warning" %}
Wählt bitte **nicht** die Trial-Version aus! Die endet nach 14 Tagen und lässt sich nicht ohne Weiteres in die Community-Edition überführen.
{% endhint %}

* Ihr erhaltet eine Bestätigungsmail an eure angegebene Email-Adresse. Darin ist ein Link enthalten, mit dem ihr eure Anmeldung bestätigt und ein Passwort festlegt. Das Passwort muss mindestens ein Sonderzeichen enthalten.\

* Nachdem ihr euer Passwort festgelegt habt, werdet ihr automatisch eingeloggt und zu Databricks weitergeleitet.&#x20;

&#x20;Nach einem Logout könnt ihr euch später jederzeit über [diesen Link](https://winf-hsos.github.io/databricks-notebooks/sql-tutorial/1\_Der\_SELECT\_Befehl.html) wieder einloggen.

Wenn ihr eingeloggt wurdet und die Databricks Startseite seht, ist die Anmeldung erfolgreich abgeschlossen.

## Notebook-Templates importieren

### Vorgehen

In Databricks arbeitet ihr stets in so genannten **Notebooks**. Ein Notebook ist eine Abfolge von **Blöcken**, in denen Anweisungen wie z.B. SQL-Abfragen enthalten sein können. Ein Code-Block kann gestartet werden, woraufhin Databricks die enthaltenen Anweisungen Schritt für Schritt ausführt. Im Falle eines SQL-Statements wird das Ergebnis bei Erfolg anschließend unter dem Block angezeigt.

{% hint style="info" %}
Wenn ein SQL-Statement ungültig ist (z. B. Syntaxfehler), dann wird euch unter dem Code-Block eine Fehlermeldung angezeigt. In den meisten Fällen enthält diese Meldung einen Hinweis darauf, was ihr falsch gemacht habt. Sollte das nicht der Fall sein postet die Meldung bei Slack, damit wir euch helfen können.
{% endhint %}

Für dieses Tutorial stelle ich eine Reihe von Notebooks bereit, die ihr in euren Account importieren könnt. In diesen Notebooks sind alle Beispiele und Aufgabenstellungen enthalten. Ihr könnt eure Lösungen einfach unter die jeweilige Aufgabe als neuen Block einfügen.

Das Vorgehen zum Importieren eines Notebooks ist einfach:

* Klickt auf den Link des Notebook-Templates, z. B. [diesen Link](https://winf-hsos.github.io/databricks-notebooks/sql-tutorial/1\_Der\_SELECT\_Befehl.html). Das Notebook öffnet sich als HTML-Seite in einem neuen Tab des Browsers.\

* Klickt auf den "Import Notebook" Button in der oberen rechten Ecke des Notebooks. Es öffnet sich ein Pop-Up Fenster mit einer URL. Kopiert die URL in die Zwischenablage (Strg + C).\

* Öffnet [Databricks](https://community.cloud.databricks.com/login.html) und loggt euch ein. Klickt im Menü links auf "Home" und wählt einen Ort aus, an dem ihr das Notebook speichern wollt. Klickt dann auf den kleinen nach unten zeigenden Pfeil und wählt "Import". \

* Im sich öffnenden Pop-Up Fenster wählt ihr den Radiobutton "URL" aus. Fügt nun die zuvor kopierte URL des Notebook-Templates in das Textfeld ein. Klickt anschließend auf "Import".

Wenn alles funktioniert hat ist das Notebook als Kopie in eurem Account gespeichert und ihr könnt damit arbeiten. Für jeden Abschnitt dieses Tutorials stelle ich ein separates Notebook bereit, das ihr importieren könnt.

#### Video

Für das Importieren von Notebooks habe ich auch ein kurzes Video erstellt:

{% embed url="https://youtu.be/35OMAYr5Vww" %}

### Liste der Notebooks

Hier die Links zu den Notebooks:

* :notepad\_spiral: [#1 Der SELECT Befehl](https://winf-hsos.github.io/databricks-notebooks/sql-tutorial/1\_Der\_SELECT\_Befehl.html)
* :notepad\_spiral: #2 Mehrere Tabellen mit Joins
* :notepad\_spiral: #3 Mengenoperationen
* :notepad\_spiral: #4 Unterabfragen
* :notepad\_spiral: #5 Window-Funktionen
* :notepad\_spiral: #6 Texte
* :notepad\_spiral: #7 Statistische Funktionen
* :notepad\_spiral: #8 Datum und Zeit

## Daten anlegen

### Vorgehen

Das erste Notebook :notepad\_spiral:****[#1 Der SELECT Befehl](https://winf-hsos.github.io/databricks-notebooks/sql-tutorial/1\_Der\_SELECT\_Befehl.html) enthält zu Beginn einen Block für das vollautomatische Anlegen der benötigten Tabellen. Diesen Block müsst ihr einmalig ausführen. Anschließend habt ihr alle für dieses Tutorial benötigte Tabellen und Datensätze als Kopie in eurem Databricks Account. Auch nach einem erneuten Login sind die Daten und Arbeitsstände eurer Notebooks weiterhin vorhanden.

* Loggt euch in eurem Databricks-Account ein und klickt links im Menü auf "Cluster".\

* Klickt auf "Create Cluster". Vergebt einen beliebigen Namen für das Cluster und belasst alle anderen Einstellungen wie sie sind (Runtime Version: 5.2, Python Version: 3). Klickt auf den Button "Create Cluster". Es wird nun im Hintergrund ein Server für euch bereitgestellt, der die benötigte Software u.a. für das Ausführen von SQL Abfragen mitbringt. Die Bereitstellung dauert ca. 2-3 Minuten. Ihr erkennt an dem grünen Punkt vor dem Cluster-Namen, dass der Server bereitsteht. \

* Sobald das Cluster bereitsteht, öffnet das Notebook :notepad\_spiral:[#1 Der SELECT Befehl](https://winf-hsos.github.io/databricks-notebooks/sql-tutorial/1\_Der\_SELECT\_Befehl.html). Klickt in den Code-Block unterhalb der Überschrift "1. Daten laden" und drückt anschließend _**Strg+Enter.**_ Alternativ könnt ihr auch auf den kleinen Play-Button im oberen Rechten Menü des Blocks klicken. Beides führt den Code innerhalb des Block aus.

Nachdem der Block ausgeführt wurde stehen euch die 4 Tabellen für dieses Tutorial bereit:

* `ted_meta`
* `ted_ratings`
* `ted_tags`
* `ted_text`

### Datenmodell

Die Abbildung unten zeigt die 4 Tabellen und deren Beziehungen untereinander.

![TED-Talks Datenmodell.](../../../.gitbook/assets/ted\_data\_model.png)
