# Assignment 3: Ist PI zufällig?

**Abgabe:** 31.03.2019 (23:59 Uhr)

Nach einer sehr langen Nacht in den Clubs von Mannheim, sind Sie beim Goldenen Emm eingekehrt, um einen Egg McMuffin zu frühstücken. Die anderen Informatik-Studierenden am Tisch fangen eine wilde Diskussion darüber an, wie sich der Umfang zum Durchmessers des Egg McMuffin verhält und wie die Kalorien von der Höhe und dem Durchmesser abhängen.

![Egg McMuffin](egg-mcmuffin.jpg)

Plötzlich sagt einer von Ihnen: "Tatsächlich ist die Zahl π sogar transzendent, was bedeutet, dass es kein Polynom mit rationalen Koeffizienten gibt, das π als eine Nullstelle hat. Als Konsequenz ergibt sich daraus, dass es unmöglich ist, π nur mit ganzen Zahlen oder Brüchen und Wurzeln auszudrücken, und dass die exakte Quadratur des Kreises mit Zirkel und Lineal nicht möglich ist."

Sie vermuten, dass er das gerade einfach von der Wikipedia geholt hat, schweigen aber erst einmal und behalten Ihre Zweifel an der Aussage für sich. Dann klappen Sie aber doch den Laptop auf - hatten Sie den wirklich die ganze Nacht in den Clubs mit dabei? - und fangen an die Frage mit einem kleinen Programm zu bearbeiten.

**Ziel**: Ziel dieses Assignments ist es, mit Ruby ein Bild zu erzeugen und einfache Stringverarbeitung zu erlernen.

## PI Zeichnen

### Grundlagen für die Aufgabe

Für dieses Assignment benötigen Sie Informationen aus den Folien [Ruby-Grundlagen](https://smits-net.de/files/pr3/folien/pr3_01_ruby-basics-slides.pdf). Zusätzlich werden Sie noch Wissen zum Einlesen von Dateien benötigen, das Sie in den Folien [Standard Typen und Reguläre Ausdrücke](https://smits-net.de/files/pr3/folien/pr3_04_ruby-standard-types-slides.pdf) im Abschnitt _Input/Output_ finden.

### Beschreibung des Programms

Sie sollen zeigen, dass die Stellen von PI wirklich vollkommen zufällig sind. Um die Mühe eines mathematischen Beweises zu sparen, wählen Sie einen grafischen Ansatz und stellen PI als Bild dar.

![PI als Bild](pi_example.png)

Schreiben Sie ein kleines Ruby-Skript, dass die Zahl PI als PNG-Bild darstellt:

  * Stellen Sie die ersten 1000.000 Stellen von PI als ein Bild von 1000x1000 Pixeln dar
  * Das Bild soll ein Graustufenbild sein im PNG-Format
  * Die Farbe jedes Pixel entspricht dem Wert der Stelle, d.h. 
    - 0: RGB(  0,   0,   0)
    - 1: RGB( 28,  28,  28)
    - 2: RGB( 56,  56,  56)
    - 3: RGB( 85,  85,  85)
    - 4: RGB(113, 113, 113)
    - 5: RGB(141, 141, 141)
    - 6: RGB(170, 170, 170)
    - 7: RGB(198, 198, 198)
    - 8: RGB(226, 226, 226)
    - 9: RGB(255, 255, 255)
  * Die Ziffern von PI werden links oben beginnend angeordnet, d.h. die erste Ziffer (`3`) an Position 0,0 und dann zeilenweise gezeichnet

Sie finden die benötigten Ziffern von PI in der Datei [pi.txt](pi.txt).

Für die einfache Erzeugung von PNG-Bilder in Ruby bietet sich die Bibliothek [ChunkyPNG](https://github.com/wvanbergen/chunky_png) an.


### Geheime Datei

Verwenden Sie nun Ihr Skript, um die Datei [secret.txt](secret.txt) ebenfalls in ein 1000x1000 Pixel Bild zu zeichnen und zu überprüfen, ob die Daten in dieser Datei auch zufällig sind.

Was sehen Sie auf dem erzeugten Bild?


### Ruby-Features

Bitte verwenden Sie die folgenden Ruby-Features in Ihrem Programm:

  * Nutzung von vorhandenen Bibliotheken mit `require`
  * Dateien mit `File` einlesen
  * Iterationen mit Hilfe von Blöcken
  * Typumwandlung zwischen Strings und Zahlen
  * Berechnung von Werten und Rundung
  * Eine fremde Bibliothek mit `gem install` einbinden und nutzen


### Abgabe

Laden Sie den Quelltext Ihres fertigen Programms in Ihr Git-Repository zur Vorlesung hoch. Wählen Sie eine geeignete Verzeichnisstruktur, um auch weitere Lösungen dort ablegen zu können.


## Vorbereitung der nächsten Stunde

Bereiten Sie sich außerdem auf die nächste Stunde vor, indem Sie die Folien [Klassen, Module, Mixins](https://smits-net.de/files/pr3/folien/pr3_02_ruby-classes-slides.pdf) durcharbeiten.

Sammeln Sie Fragen, die Sie beim Durcharbeiten der Folien und der Aufgabe haben - diese werden in der Vorlesungsstunde besprochen.


## Quellen

  * [Folien](moodle.hs-mannheim.de/course/view.php?id=2294) zur Vorlesung in Moodle
  * [Ruby Tutorial](http://rubylearning.com/satishtalim/tutorial.html)
  * Buch (online): [Learn Ruby the Hard Way](https://learnrubythehardway.org/book/)
  * PNG-Bibliothek für Ruby: [ChunkyPNG](https://github.com/wvanbergen/chunky_png)
