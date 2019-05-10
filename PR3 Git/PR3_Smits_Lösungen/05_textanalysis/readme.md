# Assignment 5: Textanalyse

**Abgabe:** 14.04.2019 (23:59 Uhr)

In einem in Kanada abgestürzten Raumschiff der außerirdischen Kryptonier wurden militärische Dokumente entdeckt, die mit einem bisher unbekannten außerirdischen Programm verschlüsselt wurden. Nun soll eine irdische Software entwickelt werden, um die Texte zu entschlüsseln und so eine mögliche Invasion der Kryptonier aufzuhalten.

![Quelle: Pixabay.com](crashed.jpg)

Der erste Schritt zum Knacken eines Codes besteht darin, die Häufigkeit von Buchstaben und Worten in durchschnittlichen Texten dieser Sprache zu kennen.

Da Sie noch nicht genau wissen, ob die kryptonische Sprache auf Zeichen oder Wörtern basiert,  wollen Sie sowohl die Häufigkeit von Wörtern als auch von Buchstaben analysieren. Glücklicherweise ist eine große Menge von kryptonischen Schund- und Kriegsromanen gefunden worden, sodass diese als Basis für die Analyse dienen können.

Sie bekommen daher die Aufgabe eine Software zu entwickeln, die die kryptonischen Texte auf Wort- und Buchstabenhäufigkeiten hin untersucht. Im ersten Schritt verwenden Sie für die Tests einen irdischen Text von Franz Kafka, der Ihnen aber ähnlich unverständlich wie das Kryptonische vorkommt.

**Ziel**: Ziel dieses Assignments ist es, mit Ruby einen Text zu analysieren und Reguläre Ausdrücke anzuwenden.


## Textanalyse-Programm

### Grundlagen für die Aufgabe

Für dieses Assignment benötigen Sie Informationen aus den Folien [Container, Blöcke und Iteratoren](https://smits-net.de/files/pr3/folien/pr3_03_ruby-containers-slides.pdf). 

### Wortliste

Entwickeln Sie eine Software zur Analyse von Wort- und Buchstabenhäufigkeiten in beliebigen Texten. Um diese Software wiederverwendbar und modular zu halten, gehen Sie bitte wie im Folgenden beschrieben vor.

Schreiben Sie eine Klasse `Wortliste`, die die Verwaltung von Worthäufigkeiten übernimmt. Über eine Methode `<<` kann man Wörter hinzufügen, wobei alle Wörter in Kleinbuchstaben umgewandelt werden. Die Klasse berechnet dann automatisch die Häufigkeiten und erlaubt es, die folgenden Informationen auszulesen:

  * die absolute Häufigkeit eines bestimmten Wortes (Methode `[]`)
  * die relative Häufigkeit eines bestimmten Wortes (Methode `frequency`)
  * die Anzahl aller gefundenen Wörter (d.h. inklusive Doubletten) (Methode `count_words`)
  * die Anzahl unterschiedlicher Wörter (d.h. exklusive Doubletten) (Methode `length`)

Weiterhin soll `Wortliste` es erlauben, über die gefundenen Worte mit der Methode `each_word` und einem Block zu iterieren und zwar beginnend bei dem häufigsten Wort bis zum am wenigsten häufigsten Wort. Der Block bekommt das Wort, die absolute und relative Häufigkeit übergeben.

Die Buchstabenhäufigkeiten können ebenfalls aus der Klasse über die Methode `each_letter` ausgelesen werden. Sie verhält sich analog zu `each_word`, allerdings sollen Sie hier innerhalb der Methode ein `Proc` anstelle eines Blocks verwenden.

### Textanalyse

Schreiben Sie ein Programm `textanalyse.rb`, das die oben beschriebenen Klassen nutzt, um beliebige Texte aus Textdateien zu analysieren. Der Name der zu analysierenden Textdatei wird auf der Kommandozeile angegeben. Das Programm lädt dann die Datei und analysiert sie entsprechend. Es gibt aus

  * den Namen der analysierten Datei
  * die Anzahl der Wörter in der Datei
  * die Anzahl unterschiedlicher Wörter in der Datei
  * die 10 häufigsten Wörter (Rang, absolute Anzahl, prozentuale Häufigkeit und das Wort selbst)
  * die Anzahl der Buchstaben in der Datei
  * die Buchstaben (Rang, absolute Anzahl, prozentuale Häufigkeit und den Buchstaben selbst)

Eine Ausgabe des Werkzeugs sieht beispielsweise wie folgt aus:

```console
Analyse der Dateil 'faust.txt'

Wörter insgesamt:         30615
Unterschiedliche Wörter:   6300

Rang - Anzahl - Häufigkeit (%) - Wort
  1 -     918   -  3.00%       - und
  2 -     691   -  2.26%       - ich
  3 -     668   -  2.18%       - die
  4 -     602   -  1.97%       - der
  5 -     426   -  1.39%       - nicht
  6 -     402   -  1.31%       - das
  7 -     398   -  1.30%       - ein
  8 -     380   -  1.24%       - zu
  9 -     362   -  1.18%       - ist
 10 -     312   -  1.02%       - du

Zeichen insgesamt:        147504

Rang - Anzahl - Häufigkeit (%) - Wort
  1 -   22834   - 15.48%       - e
  2 -   14064   -  9.53%       - n
  3 -   12273   -  8.32%       - i
  4 -    9786   -  6.63%       - r
  5 -    9716   -  6.59%       - s
  6 -    9511   -  6.45%       - h
  7 -    9143   -  6.20%       - t
  8 -    7215   -  4.89%       - a
  9 -    7061   -  4.79%       - d
 10 -    5892   -  3.99%       - u
 11 -    5772   -  3.91%       - l
 12 -    5716   -  3.88%       - c
 13 -    4683   -  3.17%       - m
 14 -    4034   -  2.73%       - g
 15 -    3168   -  2.15%       - o
 16 -    2719   -  1.84%       - b
 17 -    2708   -  1.84%       - w
 18 -    2561   -  1.74%       - f
 19 -    1628   -  1.10%       - k
 20 -    1525   -  1.03%       - z
 21 -    1327   -  0.90%       - p
 22 -     957   -  0.65%       - ü
 23 -     932   -  0.63%       - v
 24 -     724   -  0.49%       - ä
 25 -     680   -  0.46%       - ß
 26 -     480   -  0.33%       - ö
 27 -     276   -  0.19%       - j
 28 -      56   -  0.04%       - q
 29 -      51   -  0.03%       - x
 30 -      41   -  0.03%       - y
```

### TextAnalyse-Anwendung

Analysieren Sie mit dem oben beschriebenen Text-Analyse-Programm den Text [kafka.txt](kafka.txt) und geben Sie die Ausgabe als Teil Ihrer Ausarbeitung ab.

### Ruby-Features

Bitte verwenden Sie die folgenden Ruby-Features in Ihrem Programm:

  * Nutzung von vorhandenen Bibliotheken mit `require`
  * Dateien mit `File` einlesen
  * Hashes und Arrays
  * Iterationen mit Hilfe von Blöcken und Procs
  * Die Methoden `map`, `reduce`, `sort`
  * Formatierung mit Hilfe von `%` und Formatstrings

### Abgabe

Laden Sie den Quelltext Ihres fertigen Programms in Ihr Git-Repository zur Vorlesung hoch. Wählen Sie eine geeignete Verzeichnisstruktur, um auch weitere Lösungen dort ablegen zu können.


## Vorbereitung der nächsten Stunde

Bereiten Sie sich außerdem auf die nächste Stunde vor, indem Sie die Folien [Standard Typen und Reguläre Ausdrücke](https://smits-net.de/files/pr3/folien/pr3_04_ruby-standard-types-slides.pdf) durcharbeiten.

Sammeln Sie Fragen, die Sie beim Durcharbeiten der Folien und der Aufgabe haben - diese werden in der Vorlesungsstunde besprochen.


## Quellen

  * [Folien](moodle.hs-mannheim.de/course/view.php?id=2294) zur Vorlesung in Moodle
  * [Ruby Tutorial](http://rubylearning.com/satishtalim/tutorial.html)
  * Buch (online): [Learn Ruby the Hard Way](https://learnrubythehardway.org/book/)
  * Dokumentation zur [Klasse Hash](https://docs.ruby-lang.org/en/2.6.0/Hash.html)
