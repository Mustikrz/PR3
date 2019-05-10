# Assignment 2: Ruby in the sky with diamonds

**Abgabe:** 24.3.2019 (23:59 Uhr)

> Als Rubin bezeichnet man die rote Varietät des Minerals Korund. Die rote Verfärbung ist auf geringe Beimengungen von Chrom zurückzuführen. - Wikipedia

**Ziel**: Ziel dieses Assignments ist es, erste Schritte mit Ruby zu machen und die Syntax kennen zu lernen. Als Test Ihrer Kenntnisse werden Sie ein ganz einfaches Spiel in Ruby programmieren.


## Umgebung aufsetzen

Zuerst müssen Sie die Ruby-Umgebung installieren, damit Sie in der Lage sind, Ruby-Programme auszuführen. Weiterhin benötigen wir _git_, um Übungen herunter und hochzuladen.

### Mac

  * **GIT**: Laden Sie [git](https://git-scm.com/download/mac) herunter und installieren sie es.
  * **Ruby**: Installieren Sie Ruby 2.5 über [rbenv](https://github.com/rbenv/rbenv) oder [rvm](https://rvm.io)

### Windows

  * **GIT**: Laden Sie [git](https://git-scm.com/download/win) herunter und installieren sie es.
  * **Ruby**: Installieren Sie Ruby 2.5 über [Rubyinstaller](https://rubyinstaller.org)

### Linux (Ubuntu)

  * **GIT**: Kommandozeile: `sudo apt-get install git`
  * **Ruby**: Kommandozeile: `sudo apt-get install ruby`

### Editor: VS Code

**VS Code**: Laden uns installieren Sie den [VS Code Editor](https://code.visualstudio.com/Download)

Alternativ können Sie auch [RubyMine](https://www.jetbrains.com/ruby/) einsetzen. Eine Lizenz ist für Studierende kostenlos bei JetBrains erhältlich.


## Zahlenraten entwickeln

### Grundlagen für die Aufgabe

Für dieses Assignment benötigen Sie Informationen aus den Folien [Ruby-Grundlagen](https://smits-net.de/files/pr3/folien/pr3_01_ruby-basics-slides.pdf) an.

Sammeln Sie Fragen, die Sie beim Durcharbeiten der Folien und der unten stehenden Aufgabe haben - diese werden in der Vorlesungsstunde behandelt.

### Beschreibung des Programms

Schreiben Sie ein einfaches Zahlenraten-Spiel (`zahlenraten.rb`) in Ruby mit folgenden Eigenschaften:

  * Das Spiel zieht zufällig eine Zahl zwischen 1 und 100, die der Benutzer erraten soll.
  * Der Benutzer wird aufgefordert eine Zahl zwischen 1 und 100 einzugeben.
  * Hat er die richtige Zahl geraten, beendet sich das Programm und zeigt die Anzahl der Versuche an.
  * Hat er die Zahl nicht geraten, sagt ihm das Programm, ob die Zahl zu groß oder zu klein war und nimmt die nächste Eingabe entgegen.

Eine beispielhafte Session mit dem Programm sieht dann wie folgt aus:

```console
Bitte geben Sie eine Zahl ein: 50
Zu groß
Bitte geben Sie eine Zahl ein: 25
Zu groß
Bitte geben Sie eine Zahl ein: 12
Zu klein
Bitte geben Sie eine Zahl ein: 20
Zu groß
Bitte geben Sie eine Zahl ein: 16
Zu klein
Bitte geben Sie eine Zahl ein: 18
Zu klein
Bitte geben Sie eine Zahl ein: 19
Richtig nach 7 Versuchen.
```

### Ruby-Features

Bitte verwenden Sie die folgenden Ruby-Features in Ihrem Programm:

  * Ersetzung von Variablen in Strings mit `"#{VARNAME}"`
  * Generierung von Zufallszahlen mit der Klasse [Random](https://ruby-doc.org/core-2.5.1/Random.html)
  * Lesen von Zahlen und Strings von er console mit `gets`

### Abgabe

Laden Sie den Quelltext Ihres fertigen Programms in Ihr Git-Repository zur Vorlesung hoch. Wählen Sie eine geeignete Verzeichnisstruktur, um auch weitere Lösungen dort ablegen zu können.


## Vorbereitung der nächsten Stunde

Bereiten Sie sich außerdem auf die nächste Stunde vor, indem Sie die Folien [Ruby-Grundlagen](https://smits-net.de/files/pr3/folien/pr3_01_ruby-basics-slides.pdf) durcharbeiten.

Sammeln Sie Fragen, die Sie beim Durcharbeiten der Folien und der Aufgabe haben - diese werden in der Vorlesungsstunde besprochen.


## Quellen

  * [Folien](moodle.hs-mannheim.de/course/view.php?id=2294) zur Vorlesung in Moodle
  * Kurzanleitung [To Ruby From Java](https://www.ruby-lang.org/en/documentation/ruby-from-other-languages/to-ruby-from-java/)
  * [Ruby Tutorial](http://rubylearning.com/satishtalim/tutorial.html)
  * Buch (online): [Learn Ruby the Hard Way](https://learnrubythehardway.org/book/)
