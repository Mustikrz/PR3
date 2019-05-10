# Aufgabenblock 5: Fortgeschrittene Themen

Die Aufgaben in dieser Einheit beziehen sich auf die Vorlesungsfolien __Fortgeschrittene Themen__. 

Folgende Themen werden durch die Aufgaben abgedeckt:

  * Singleton-Methoden
  * Eigenclass
  * Metaprogramming
  * Reflection


## 1. Klassen per Reflection analysieren
Schreiben Sie eine Methode `analyze`, der man eine Klasse übergibt und die dann folgende Informationen zu der Klasse ausgibt:

  * Name der Klasse
  * Elternklasse
  * Instanzmethoden
  * Statische Methoden
  * Konstanten

Beispiel:

```console
> analyze(String)
Name:               String
Elternklasse:       Object
Instanz-Methoden:   [:encode, :include?, ...]
Statische-Methoden: [:try_convert]
Konstanten:         []
```



## 2. Methoden einer Klasse dynamisch erzeugen
Schreiben Sie eine Funktion `leet_class`, die zu jeder vorhandenen (nicht geerbten) Instanzmethode eine weitere Methode hinzufügt, die den Namen der ursprünglichen Methode in _Leet Speak_ hat. Die neue Methode muss keine Funktion haben, kann aber auch gerne an die ursprüngliche Methode delegieren.

Beispiel:

```ruby
class M
  def hello; end
  def world; end
end

leet_class(M)

m = M.new
m.h3ll0
m.w0rld
```



## 3. Klasse dynamisch erzeugen
Schreiben Sie eine Funktion `create_class`, der man den die Superklasse übergeben kann. Die Funktion erzeugt dann dynamisch die Klasse und fügt ihr eine Methode `who_am_i` hinzu, die als Text "Ich bin ein Kind von " + den Namen der Superklasse zurückgibt.



## 4. Methoden dynamisch aufrufen
Schreiben Sie eine Funktion `crazy_caller`, der man ein Objekt übergeben kann. Die Funktion schaut nach, welche Methoden auf dem Objekt aufrufbar sind und ruft dann alle Methoden auf, die keinen Parameter benötigen.

Einige Methoden werden einen Fehler werfen, fangen Sie diesen ab.



## 5. Eigenclass einer Klasse
Fügen Sie der Klasse `Numeric` über deren _Eigenclass_ eine _statische Methode_ `to_binary` hinzu, der man eine Zahl übergibt und diese in binärer Darstellung als String zurück bekommt.



## 6. Eigenclass eines Objektes
Der unten stehende Code erzeugt zwei Objekte vom Typ `String`. Fügen Sie der _Eigenclass_ von `s2` eine _Methode_ `to_leet` hinzu, die den Inhalt des Objektes in "Leet Speak" ausgibt.

```ruby
s1 = "Hallo"
s2 = "Welt"
```



## 7. Macro
Schreiben Sie ein Modul `Javanator`, das eine Klassen einbinden kann. Durch Aufruf der Methode `javafy` kann die Klasse sich dann die Methode `toString` hinzufügen lassen, die einfach nur `to_s` aufruft.

Beispiel:

```ruby
class Test
  include Javanator
  Javanator::javafy
end

t = Test.new
t.toString
```



## 8. Metaprogrammierung: Die kleine Petze
Schreiben Sie eine Ruby Klasse `Snitch`, deren Objekte man an jede beliebige Ruby-Methode übergeben kann. `Snitch` soll dann auf der Console ausgeben, welche Methoden mit welchen Parametern auf ihm aufgerufen wurden.



## 9. Singleton Methoden
Der unten stehende Code erzeugt zwei Objekte vom Typ `String`. Fügen Sie `s2` eine _Singleton Methode_ `to_leet` hinzu, die den Inhalt des Objektes in "Leet Speak" ausgibt.

```ruby
s1 = "Hallo"
s2 = "Welt"
```



## 10. Struct
Verwenden Sie die Klasse `Struct`, um sehr einfach eine Klasse zur Verwaltung von Studierenden (`Studierender`) zu erzeugen. Ein Studierender hat folgende Eigenschaften:

  * Vorname
  * Nachname
  * Geburtsdatum
  * Matrikelnummer
  * Fakultät

Fügen Sie eine `to_s`-Methode zur Klasse hinzu, die nur die Matrikelnummer zurückgibt.

Erzeugen Sie danach ein Objekt von Ihrer Klasse.



