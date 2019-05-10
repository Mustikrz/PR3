# Assignment 4: Vektor

**Abgabe:** 07.04.2019 (23:59 Uhr)

Sie nicken während der Vorlesung ein und fallen in einen tiefen Schlaf, wobei Sie sehr intensiv träumen. In Ihrem Traum müssen Sie noch einmal die Vorlesung Lineare Algebra besuchen und die Klausur dazu schreiben - obwohl es diese doch gar nicht mehr gibt und Sie all Ihre Mathe-Prüfungen bereits mit Bravour bestanden haben. Als Sie aufwachen, beschließen Sie die Lineare Algebra für immer aus Ihrem Leben zu verbannen, indem Sie sich passende Klassen und Programme schreiben.

![Quelle: Pixabay.com](kryptonier.jpg)

Gerade als Sie merken, dass diese blöden Geschichten Sie überhaupt nicht zur Bearbeitung der Assignments motivieren passiert es ... Es gibt einen lauten Knall. Sie schauen zum Himmel uns sehen dort ein Raumschiff der Kryptonier, die offensichtlich die Weltherrschaft an sich reißen wollen. Zum Glück haben Sie noch eine kleine Rakete im Garten, die Sie auf das Raumschiff abfeuern könnten. Aber wie bloß die Flugbahn berechnen?

**Ziel**: Ziel dieses Assignments ist es, eine Klasse in Ruby zu schreiben und diese mit Unit-Tests zu testen.

## Klasse Vektor

### Grundlagen für die Aufgabe

Für dieses Assignment benötigen Sie Informationen aus den Folien [Klassen, Module, Mixins](https://smits-net.de/files/pr3/folien/pr3_02_ruby-classes-slides.pdf). Wie man Unit-Tests schreibt finden Sie in [Ruby-Grundlagen](https://smits-net.de/files/pr3/folien/pr3_01_ruby-basics-slides.pdf).

### Beschreibung des Programms

Implementieren Sie eine Klasse `Vektor` in einer Datei `vektor.rb` mit deren Hilfe man dreidimensionale Vektoren erzeugen und die wichtigsten Vektor-Operationen durchführen kann.

`Vektor` soll die folgende Aktionen unterstützen:

  * Anlegen eines neuen Vektors und Befüllen des Vektors mit Daten (`Vektor.new(1, 2, 3)`)
  * Erzeugen eines Nullvektors (alle drei Komponenten [x,y,z] sind 0) (`Vektor.new`)
  * Addieren zweier Vektoren (Methode `+`)
  * Subtrahieren zweier Vektoren (Methode `-`)
  * Auslesen einzelner Komponenten x, y und z
  * Multiplikation des Vektors mit einem Skalar (Methode `*`)
  * Skalarmultiplikation zweier Vektoren (Methode `*`)
  * Kreuzprodukt zweier Vektoren (Methode `%`)
  * Erzeugung des Einheitsvektors aus einem gegebenen Vektor (d.h. Vektor der Länge 1 mit der selben Richtung wie der ursprüngliche Vektor) (Methode `einheitsvektor`). Beachten Sie, dass vom Nullvektor kein Einheitsvektor erzeugt werden kann. In diesem Fall werfen Sie bitte einen `ArgumentError`. 
  * Berechnung des Betrages (der Länge) eines Vektors (Methode `betrag`)
  * Test, ob zwei Vektoren kollinear (parallel oder antiparallel) sind (Methode `kollinear?`)

Bitte denken Sie daran auch eine Methode zu implementieren mit dem man testen kann ob zwei Vektoren gleich sind. Weiterhin ist es für die Programmentwicklung und den Test empfehlenswert eine Methode zur Konvertierung des Vektors in eine Zeichenkette zu implementieren. 

Überprüfen Sie die Funktionalität Ihrer Implementierung mit entsprechenden Unit-Tests (Datei `vektor_test.rb`) und weise Sie mit diesen Tests nach, dass die implementierten Operationen richtig funktionieren. Verwenden Sie bitte __mindestens__ die folgenden Testdaten:


#### Multiplikation mit einem Skalar

  * `[1, -5, 3] * 6 = [ 6, -30, 18 ]`
  * `[ 1, -5, 3 ] * -3 = [ -3, 15, -9 ]`


#### Skalarprodukt zweier Vektoren

  * `[ 1, 2, 3 ] * [ -7, 8, 9 ] = 36`
  * `[ -5, 9, 7 ] * [ 10, 3, 8 ] = 33`


#### Addition und Subtraktion

  * `[ 4, 0, 8 ] + [ -1, 4, 7 ] = [ 3, 4, 15 ]`
  * `[ 4, 0, 8 ] - [ -1, 4, 7 ] = [ 5, -4, 1 ]`
  * `[ 4, 0, 8 ] + [ -1, 4, 7 ] = [ -1, 4, 7 ] + [ 4, 0, 8 ]`


#### Kreuzprodukt

  * `[ 1, 2, 3 ] x [ -7, 8, 9 ] = [ -6, -30, 22 ]`
  * `[ 1, 2, 8 ] x [ 4, 3, 5 ] = [ -14, 27, -5 ]`


#### Betrag

  * `|[ 1, 1, 1 ]| = sqrt(3)`
  * `|[ 5, 4, 3 ]| = sqrt(50)`


#### Kollinearität

  * `[ 4, 5, 7 ]` und `[ 16, 20, 28 ]` sind kollinear
  * `[ 4, 5, 7 ]` und `[ 16, 20, 21 ]` sind nicht kollinear


#### Komplexere Rechnung

  * `([ -1, 5, -2 ] x [ 2, 1, 2 ]) * [ 2, 0, 5 ] = -31`


### Zusatzaufgabe

Wenn Sie Zeit und Lust haben, können Sie die Klasse `Integer` durch einen Monkey Patch so verändern, dass man statt `vektor * 5` auch `5 * vektor` schreiben kann. Testen Sie, ob dieser Patch funktioniert über einen passenden Unit-Tests.

_Tipp_: Sie werden das Schlüsselwort `alias` bzw. die Methode `alias_method` einsetzen wollen, um das Ziel zu erreichen.


### Ruby-Features

Bitte verwenden Sie die folgenden Ruby-Features in Ihrem Programm:

  * Generierung von "Gettern" und "Settern" mit `attr_accessor`
  * Werfen von Ausnahmen mit `raise`
  * Überladen von Operatoren, hier `+`, `-`, `*` und `%`
  * Überscheiben der `==` und `to_s` Methoden
  * Unit-Tests mit `minitest/autorun`


### Abgabe

Laden Sie den Quelltext Ihres fertigen Programms in Ihr Git-Repository zur Vorlesung hoch. Wählen Sie eine geeignete Verzeichnisstruktur, um auch weitere Lösungen dort ablegen zu können.


## Vorbereitung der nächsten Stunde

Bereiten Sie sich außerdem auf die nächste Stunde vor, indem Sie die Folien [Container, Blöcke und Iteratoren](https://smits-net.de/files/pr3/folien/pr3_03_ruby-containers-slides.pdf) durcharbeiten.

Sammeln Sie Fragen, die Sie beim Durcharbeiten der Folien und der Aufgabe haben - diese werden in der Vorlesungsstunde besprochen.


## Quellen

  * [Folien](moodle.hs-mannheim.de/course/view.php?id=2294) zur Vorlesung in Moodle
  * [Ruby Tutorial](http://rubylearning.com/satishtalim/tutorial.html)
  * Buch (online): [Learn Ruby the Hard Way](https://learnrubythehardway.org/book/)
  * Ruby-Dokumentation: [Help and documentation for the Ruby programming language](https://ruby-doc.org/)
  * Vektorrechnung: [Wikipedia: Vektor - Rechenoperationen](https://de.wikipedia.org/wiki/Vektor#Rechenoperationen)
