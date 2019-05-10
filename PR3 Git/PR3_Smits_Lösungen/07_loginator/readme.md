# Assignment 7: Metaprogrammierung

**Abgabe:** 05.05.2019 (23:59 Uhr)

Nach einigen Vorfällen auf einem Ausflug nach Las Vegas müssen Sie die USA überstürzt verlassen: Sie werden wegen der Zerstörung von Mobiliar in einem Hotel und der Entführung einer Giraffe gesucht; außerdem ist einer Ihrer Mitreisenden spurlos in Las Vegas verschwunden. Es bleibt nur noch die Flucht, die Sie zurück in das verregnete Deutschland führt.

Da Sie viel Freude an der Arbeit bei einem Geheimdienst gefunden haben, bewerben Sie sich beim Bundesnachrichtendienst (BND) in Pullach. Dort werden Sie auch tatsächlich angenommen - wobei man Ihnen allerdings die Auflage macht, dass Sie sich vom nahegelegenen Münchner Zoo fernhalten müssen.

Der BND möchte eine Möglichkeit, seine Ruby-Programme automatisch mit Logging zu versehen. Oder vielleicht geht es auch um die Programme anderer Leute, das wollen Sie gar nicht so genau wissen.

**Ziel**: Ziel dieses Assignments ist es, einen mit Hilfe der Meta-Programmierung in Ruby ein Modul zu schreiben, dass beliebige Klassen automatisch mit Logging versieht.


## Log-Instrumentierung

### Grundlagen für die Aufgabe

Für dieses Assignment benötigen Sie Informationen aus den Folien [Fortgeschrittene Themen](https://smits-net.de/files/pr3/folien/pr3_05_ruby-advanced-slides.pdf). 

### Beschreibung des Programms

Schreiben Sie ein Modul `Loginator`, dass von einer beliebigen Ruby Klasse per `extend` eingebunden werden kann. Nach Aufruf einer von `Loginator` angebotenen Methode `logify_me` werden alle Methoden der Klasse mit Logging versehen. Das Logging soll auf der Console den Namen der aufgerufenen Methode, den Wert der Aufrufparameter und den Rückgabewert ausgeben. Die ursprüngliche Methode soll weiter ausgeführt werden.

Testen Sie Ihr Modul mit einer selbstgeschriebenen und einer Standardklasse von Ruby.

### Beispiel

Ein Beispiel zur Verwendung von `Loginator` durch die Klasse `A`

```ruby
class A
  extend Loginator

  def add(a, b)
    a + b
  end

  def sub(a, b)
    a - b
  end
  logify_me
end
```

Aufrufe der der Methoden von `A` werden jetzt geloggt, z.B.

```ruby
a = A.new
a.add(3, 5)
a.sub(7, 4)
```

Ausgaben

```console
Methode add(3, 5) gerufen
Rückgabewert 8
Methode sub(7, 4) gerufen
Rückgabewert 3
```

### Ruby-Features

Bitte verwenden Sie die folgenden Ruby-Features in Ihrem Programm:

  * Nutzung von vorhandenen Bibliotheken mit `require` und `require_relative`
  * Methoden mit `alias` bzw. `alias_method` umbenennen
  * Methoden mit `define_method` dynamisch erzeugen
  * Methoden einer Klasse mit `instance_methods` untersuchen

### Abgabe

Laden Sie den Quelltext Ihres fertigen Programms in Ihr Git-Repository zur Vorlesung hoch. Wählen Sie eine geeignete Verzeichnisstruktur, um auch weitere Lösungen dort ablegen zu können. 


## Quellen

  * [Folien](moodle.hs-mannheim.de/course/view.php?id=2294) zur Vorlesung in Moodle
  * [Ruby Tutorial](http://rubylearning.com/satishtalim/tutorial.html)
  * Buch (online): [Learn Ruby the Hard Way](https://learnrubythehardway.org/book/)
  * Ruby-Dokumentation: [Help and documentation for the Ruby programming language](https://ruby-doc.org/)
