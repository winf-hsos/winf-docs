# Markdown

Markdown ist eine einfache Möglichkeit, Dokumente zu strukturieren und zu formatieren. Der Fokus kann auf die Inhalte gelegt werden, statt auf das Aussehen des Dokuments.&#x20;

Markdown kennt nur wenige Konstrukte und ist daher einfach zu erlernen. Eine gute Übersicht über die vorhandenen Syntaxelemente findet ihr hier:

{% embed url="https://www.markdownguide.org/basic-syntax/" %}

## Markdown in Databricks Notebooks

Databricks Notebooks unterstützen Markdown als Sprache in Code-Blocks. Das erlaubt es uns strukturierte und formatierte Dokumentation für unseren Code (z.B. SQL, Python) zu erstellen und das in direkter Verbindung mit dem Code. Die Dokumentation ist also nicht getrennt von der Sache, die dokumentiert wird, was das Lesen und Verstehen deutlich erleichtert.

Um einen Block als Markdown zu deklarieren schreibt ihr einfach in die erste Zeile `%md`.

```markup
%md
# Meine ersten Schritte mit Markdown

Dieser Text wird als *Markdown* interoretiert und formatiert dargestellt.
```

{% hint style="info" %}
Ihr könnt HTML? Super: Ihr könnt in Databricks Notebooks Markdown und HTML beliebig mischen. Das gibt euch noch mehr Flexibilität bei der Dokumentation.
{% endhint %}

## Überschriften

Eine Überschrift wird in Markdown mit dem `#` Symbol erstellt. Um unterschiedliche Ebenen zu definieren werden einfach mehrere Rauten aneinander gereiht:

```
# Überschrift 1. Grades
## Überschrift 2. Grades
### Überschrift 3. Grades
```

## Listen

Listen können entweder mit dem Spiegelstrich (`-`) oder mit einer Zahl gefolgt von einem Punkt (`1.`\`) erstellt werden. Erstere erzeugt eine ungeordnete Liste, zweites erzeugt eine nummerierte Liste. Um eine verschachtelte Liste zu erhalten kann mit einem Tabulator eingerückt werden:

```
- Item einer ungeordneten Liste
- Noch ein Item auf der ungeordneten Liste
    - Sub-Item 1
    - Sub-Item 2
    
1. Erstens
2. Zweitens
3. Drittens
```

## Hyperlinks

Auch Links können wir mit einer einfachen Syntax erstellen:

```
[Dieser Text](https://hs-osnabrueck.de) ist verlinkt.
```

Der Text innerhalb der eckigen Klammern wird als Link angezeigt, der zu der Adresse führt, die in den runden Klammern angegeben ist.

## Abbildungen

Abbildungen werden ähnlich erzeugt wie Links und nur mit einem Ausrufungszeichen vorangestellt:

```
![Alt Text](https://www.hs-osnabrueck.de/typo3conf/ext/hsos_core/Resources/Public/Images/logo.svg)
```

## Links

* [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
