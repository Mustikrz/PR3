# Aufgabenblock 4: Ruby Typen

Die Aufgaben in dieser Einheit beziehen sich auf die Vorlesungsfolien __Standard Typen und Reguläre Ausdrücke__. 

Folgende Themen werden durch die Aufgaben abgedeckt:

  * Zahlen
  * Strings
  * Ranges
  * Reguläre Ausdrücke
  * Ausnahmen
  * Input/Output


## 1. Ausnahmen
Schreiben Sie eine Funktion `division`, die zwei Zahlen dividiert. Die Funktion soll einen `ArgumentError` werfen, wenn einer der Parameter keine Zahl ist. Außerdem soll ein `ZeroDivisionError` geworfen werden, falls versucht wird durch 0 zu dividieren.

Testen Sie die Funktion und fangen Sie die Ausnahmen, um sie auszugeben.



## 2. Klasse Dir und IO
Schreiben Sie Skript, das mit Hilfe der Klassen `Dir` und `IO` alle Dateien im aktuellen Verzeichnis mit der Endung `.txt` ausgibt. Dabei sollen für jede Zeile und Datei die Zeilennummern vorangestellt werden.



## 3. Iteratoren auf Zahlen
Schreiben Sie eine Countdown von 10 auf 0. Verwenden Sie dazu die Methode `downto` von `Number`.



## 4. Quine
Schreiben Sie ein Ruby-Programm, dass sich selbst ausgibt. Es darf seinen Quelltext _nicht_ einlesen, sondern nur Ausgabeanweisungen enthalten.

_Tipp_: Sie werden eine Variable mit dem Programm als String benötigen. In dem String selbst wird sich ein Platzhalter für einen Formatter befinden.



## 5. Reguläre Ausdrücke: Match
Schreiben Sie eine Ruby-Methode `tag?`, die angibt, ob es sich bei dem übergebenen String um ein HTML-Tag handelt. Verwenden Sie hierzu einen entsprechenden regulären Ausdruck.

Beispiel:
```ruby
tag?("<a href='xx'>") # -> true
tag?("hugo <jjj>") # -> false
tag?("<a href='xx'") # -> false
tag?("<p/>") # -> true
tag?("<p") # -> false
tag?("p>") # -> false
```



## 6. Reguläre Ausdrücke: Matching
Schreiben Sie eine Funktion `reverser`, die bei einem String, der aus zwei Wörtern besteht (durch Leerzeichen getrennt), diese umdreht. Verwenden Sie hierzu einen Regulären Ausdruck.

Beispiel:

```ruby
s = "Ruby Programmierer"
puts reverser(s)
# -> "Programmierer Ruby"
```



