# Assignment 6: Passwortcracker

**Abgabe:** 28.04.2019 (23:59 Uhr)

Wegen Ihrer hervorragenden Arbeit an der Textanalysesoftware hat Sie der hier nicht genannte amerikanische Geheimdienst in die USA verschleppt. Dort herrscht ein drastischer Mangel an Informatikern, da alle mit dem Abhören des Internets beschäftigt sind. 

In den USA sollen Sie helfen, eine Million Dollar in BitCoin wiederzubeschaffen, die in Las Vegas auf einer verschlüsselten Festplatte gespeichert wurden. Es ist der NSA gelungen, die Hashes der Passwörter zu beschaffen, die der Besitzer auf anderen Webseiten benutzt hat.

Ihre Aufgabe ist es nun, die Passwörter zu knacken.

**Ziel**: Ziel dieses Assignments ist es, einen Passwortcracker in Ruby zu schreiben. Das Lernziel ist es, weitere Ruby-Features kennen zu lernen.


## Passwort-Cracker

### Grundlagen für die Aufgabe

Für dieses Assignment benötigen Sie Informationen aus den Folien [Standard Typen und Reguläre Ausdrücke](https://smits-net.de/files/pr3/folien/pr3_04_ruby-standard-types-slides.pdf). 


### Passwort-Verschlüsseler verstehen und nutzen

Ein Programm, um Passwörter zu erzeugen und zu testen, ist bereits gegeben: [crypter.rb](./crypter.rb). Sehen Sie sich dieses an, damit Sie verstehen, wie die Passwort erzeugt und gespeichert werden.

```
$ ./crypter.rb Mutti123
AzNkUOuU9ePyok7lDPoqdg==|NjlmMjMzYmI2Mjc2NGE5YzAyN2YwN2EzNWM2YTY5NzA=
```

```
$ ./crypter.rb Mutti123 "AzNkUOuU9ePyok7lDPoqdg==|NjlmMjMzYmI2Mjc2NGE5YzAyN2YwN2EzNWM2YTY5NzA="
Korrekt

$ ./crypter.rb Mutti323 "AzNkUOuU9ePyok7lDPoqdg==|NjlmMjMzYmI2Mjc2NGE5YzAyN2YwN2EzNWM2YTY5NzA="
Falsch
```

Das Programm ist so geschrieben, dass Sie es in Ihr Programm inkludieren können (`require_relative`) und dann die vorhandenen Funktionen nutzen. Sie müssen sich also nicht mit der eigentlichen Passwort-Verschlüsselung herum schlagen.

### Passwort-Cracker schreiben

Schreiben Sie einen Passwort-Cracker (`cracker.rb`) in Ruby. Das Programm bekommt auf der Kommandozeile einen Passwort-Hash (erzeugt vom Programm oben) übergeben und versucht ein zu dem Hash passendes Passwort zu finden. Hierbei geht es wie folgt vor:

  1. Zuerst wird eine Datei mit üblichen Wörtern und Begriffen getestet (z.B. `wortliste.txt`). Wird hierbei das Passwort gefunden, bricht das Programm ab. Der Name der Datei wird als zweiter Parameter übergeben. Eine Beispielhafte Datei ist mit [wortliste.txt](wortliste.txt) gegeben.
  2. Wird auf jedes Wort aus der Datei mit den Wörtern eine Transformation angewandt, die in einer weiteren Datei (z.B. `transform.txt`) als regulärer Ausdruck angegeben sind, z.B. `/e/ '3'` ersetzt alle "e" durch eine "3". Wird hierbei das Passwort gefunden, bricht das Programm ab. Eine Beispielhafte Datei ist mit [transform.txt](transform.txt) bereits gegeben.
  3. Als nächstes wird ein Brute-Force-Angriff versucht, bei dem einfach Kombinationen von Zeichen (Buchstaben, Zahlen und Sonderzeichen) durchprobiert werden.

Geben Sie nach jedem Schritt die Laufzeit aus.

Ein beispielhafter Aufruf des Tools sähe dann so aus

```console
> cracker.rb "WWrDFKDQfra6ZG/tTUTowg==|OWJjNzBiMDkxMWVlMjQ4MzY1YTc1ZjUzZWI5YWEyNGM=" wortliste.txt transform.txt
Teste gegen Worliste wortliste.txt
Laufzeit: 0.61 s

Teste wortliste.txt mit Modifikationen aus transform.txt
Laufzeit: 3.31 s

Brute Force Angriff Länge 1
Laufzeit: 0.00s

Brute Force Angriff Länge 2
Laufzeit: 0.03s

Brute Force Angriff Länge 3
Laufzeit: 2.32s

Brute Force Angriff Länge 4
Gefunden: asdf
Laufzeit: 0.47s
```

Sehen Sie vor, dass das Programm bei Angabe der zusätzlichen Option `-v` Ausgaben zu den getesteten Wörtern macht.

### Passwörter cracken

Knacken Sie die folgenden Passwörter:

  * `GU9hnu6zy1epLKlatP95eg==|MWU3ZjJjMmY4NTI5MDA5YmQ2Y2M0OTYyN2Y2ZmI5ODU=`
  * `Qfgf3j0NmFfs3i9pviMqqA==|NGY5NmVhNGE2YTM2NDFhNDgyNTE1ODVhNTkyZjk3ZGI=`
  * `tvzL+q2OH9/nRx28hsIamA==|NGVhZTk3ZGI2M2QyY2RmNGVmNDEzZmNjMDE3NGIxMTY=`

### Hash-Algorithmus wechseln

Das vorliegende Skript `crypter.rb` verwendet den für Passwörter _vollkommen_ ungeeigneten MD5-Algorithmus. Ändern Sie dies, in dem Sie die Zeile `require_relative "crypter_md5"` gegen `require_relative "crypter_scrypt"` austauschen. Hierdurch wird der deutlich bessere _scrypt_ Algorithmus für das Hashen der Passwörter verwendet.

Versuchen Sie nun, das folgende Passwort zu knacken:

  * `O8Od9OJpwEDi1fxhAEkuWQ==|rWCtY7zidb91yiQyHh4duQSb8NL21hF9SZpAf8VDEDc=`

Was fällt Ihnen auf?

### Ruby-Features

Bitte verwenden Sie die folgenden Ruby-Features in Ihrem Programm:

  * Lesen von Kommandozeilenargumenten aus dem `ARGV`-Array
  * Nutzung von vorhandenen Bibliotheken mit `require` und `require_relative`
  * Dateien mit `File` einlesen
  * Iterationen mit Hilfe von Blöcken        
  * Erzeugung von Permutation von Arrays mit Hilfe der `repeated_permutation`-Methode
  * Zeitmessungen mit `Time.now`

### Abgabe

Laden Sie den Quelltext Ihres fertigen Programms in Ihr Git-Repository zur Vorlesung hoch. Wählen Sie eine geeignete Verzeichnisstruktur, um auch weitere Lösungen dort ablegen zu können. Die geknackten Passwörter schreiben Sie bitte in eine Textdatei namens `passwords.txt` und laden sie ebenfalls hoch.


## Vorbereitung der nächsten Stunde

Bereiten Sie sich außerdem auf die nächste Stunde vor, indem Sie die Folien [Fortgeschrittene Themen](https://smits-net.de/files/pr3/folien/pr3_05_ruby-advanced-slides.pdf) durcharbeiten.

Sammeln Sie Fragen, die Sie beim Durcharbeiten der Folien und der Aufgabe haben - diese werden in der Vorlesungsstunde besprochen.


## Quellen

  * [Folien](moodle.hs-mannheim.de/course/view.php?id=2294) zur Vorlesung in Moodle
  * [Ruby Tutorial](http://rubylearning.com/satishtalim/tutorial.html)
  * Buch (online): [Learn Ruby the Hard Way](https://learnrubythehardway.org/book/)
  * Ruby-Dokumentation: [Help and documentation for the Ruby programming language](https://ruby-doc.org/)
