# Aufgabenblock 2: Ruby Klassen

Die Aufgaben in dieser Einheit beziehen sich auf die Vorlesungsfolien __Klassen, Module, Mixins__. 

Folgende Themen werden durch die Aufgaben abgedeckt:

  * Klassen
  * Variablen
  * Methoden
  * Vererbung
  * Modules
  * Mixins
  * Duck-Typing


## 1. Zugriffsmethoden
Gegeben sei die folgende Ruby-Klasse:

```ruby
class Professor
  def initialize(name, fach)
    @name = name
    @fach = fach
  end

  def to_s
    "Prof. #{@name} lehrt #{@fach}"
  end
end
```

Ändern Sie die Klasse so ab, dass man die das Attribut `@name` lesen und das Attribut `@fach` lesen und schreiben kann. Verwenden Sie die `attr_`-Methoden, um eine möglichst kompakte Lösung zu bekommen.

---

```ruby
class Professor
  attr_reader :name
  attr_accessor :fach

  def initialize(name, fach)
    @name = name
    @fach = fach
  end

  def to_s
    "Prof. #{@name} lehrt #{fach}"
  end
end

p = Professor.new('Smits', 'PR3')
puts p.name
puts p.fach
p.fach = 'WIA'
puts p.fach
```


## 2. Klasse deklarieren
Schreiben Sie eine Ruby-Klasse `Ticket`, die Tickets für Fußballspiele repräsentieren kann. Die Klasse soll das Spiel und eine übergreifende Seriennummer speichern.

Versehen Sie die Klasse mit einem Konstruktor, um Instanzen anlegen zu können. Der Konstruktor soll nur das Spiel bekommen, die Seriennummer verwaltet die Klasse selbst und zählt sie für jedes Ticket hoch.

Überschreiben Sie die `to_s`-Methode so, dass man Tickets einfach ausgeben kann.

Sehen Sie eine _statische_ Methode `verkauft` vor, um die aktuell verkaufte Anzahl von Tickets (höchste Seriennummer) auszulesen.

Testen Sie Ihre Klasse, indem Sie Objekte anlegen und ausgeben.

---
```ruby
class Ticket

  attr_reader :spiel

  @@seriennummer = 1

  def initialize(spiel)
    @spiel = spiel
    @seriennummer = @@seriennummer
    @@seriennummer += 1
  end

  def to_s
    "#{@spiel} [#{@seriennummer}]"
  end

  def self.verkauft
    @@seriennummer
  end
end

t1 = Ticket.new('Dortmund-Schalke')
t2 = Ticket.new('Hoffenheim-Stuttgart')

puts t1
puts t2
puts Ticket::verkauft
```

## 3. Default Parameter
Schreiben Sie eine Methode `produkt`, der man 2, 3, oder 4 Zahlen übergeben kann. Die Methode berechnet dann das Produkt und gibt es zurück. Verwenden Sie _Default Parameter_ um diese Methode zu realisieren.

---
```ruby
def produkt(a, b, c = 1, d = 1)
  a * b * c * d
end

puts produkt(5, 7)
puts produkt(5, 7, 8)
puts produkt(5, 7, 8, 3)
```





## 4. Vererbung
Schreiben Sie eine Klasse `Mensch`, die den Namen und das Alter eines Menschen speichert. Leiten Sie davon die Klasse `Student` ab, die zusätzlich noch die Matrikelnummer enthält. Sorgen Sie dafür, dass die Objekte bei der Erzeugung korrekt initialisiert werden.

Überschreiben Sie in beiden Klassen sinnvoll die `to_s`-Methode.

---
```ruby
class Mensch
  attr_reader :name, :alte

  def initialize(name, alter)
    @name, @alter = name, Integer(alter)
  end

  def to_s
    "#{@name}, Alter: #{@alter}"
  end  
end

class Student < Mensch
  attr_reader :matrikel_nr

  def initialize(name, alter, matrikel_nr)
    super(name, alter)
    @matrikel_nr = matrikel_nr
  end

  def to_s
    super + ", Matrikel-Nr.: #{@matrikel_nr}"
  end
end

s = Student.new('Emil Meier', 22, '1822233')
```


## 5. Keyword-Parameter
Schreiben Sie eine Methode `greet`, der man Name und Vorname übergeben kann und die den Aufrufer dann mit "Hello" und dem Vornamen, gefolgt vom Nachnamen begrüßt. Die Reihenfolge der Parameter `vorname` und `nachname` sollen beliebig sein. Verwenden Sie deswegen Schlüsselwort-Parameter.

---
```ruby
def greet(vorname:, nachname:)
  puts "Hello #{vorname} #{nachname}"
end

greet(vorname: 'Barbara', nachname: 'Liskov')
greet(nachname: 'Liskov', vorname: 'Barbara')
```



## 6. Mixin benutzen
Schreiben Sie eine Klasse `Squares`, die das Mixin `Enumerable` einbindet und Quadratzahlen beginnend bei 1 bis zu einer im Konstruktor definierten Obergrenze `max` liefert.

---
```ruby
class Squares
  include Enumerable

  def initialize(max)
    @max = max
  end

  def each
    for i in 1..@max
      yield i ** 2
    end
  end
end

s = Squares.new(20)
s.each { |e| puts e }
s.first
```

## 7. Modul schreiben
Erstellen Sie ein Modul `Chemie`, das die _Avogadro-Konstante_ (6,02214179 × 10^23) `N_a` und das Molvolumen (22,413996 l/mol) `M_v` enthält. Außerdem soll es eine Methode `volume_o2` enthalten, die für eine gegebene Masse (`m_O`) Sauerstoff das Volumen berechnet. Die Formel hierzu ist `m_O / 32 * M_v`.

Testen Sie das Modul mit eigenen Daten.

---
```ruby
module Chemie
  N_a = 6.02214179E23
  M_v = 22.413996

  def Chemie.volume_o2(m_O)
    m_O / 32 * M_v
  end
end

puts Chemie::N_a
puts Chemie::volume_o2(10.0)
```



## 8. Monkey Patch
Schreiben Sie einen Monkey Patch, der die Klasse `String` um die Methode `to_leet` erweitert. Diese Methode gibt den Inhalt des Strings zurück, macht aber in der Rückgabe vorher die folgenden Ersetzungen: 

  * `a` -> `4`
  * `e` -> `3`
  * `i` -> `1`
  * `o` -> `O`
  * `t` -> `7`


---
```ruby
class String
  def to_leet
    self.gsub(/[aeiot]/, { 'a' => '4', 'e' => '3',
        'i' => '1', 'o' => '0', 't' => '7'})
  end
end

print "hello leet".to_leet # => h3ll0 l337
```



## 9. Geschachtelte Methoden
Schreiben Sie eine Klasse `Bomb`. Diese soll eine statische Methode `activate` haben. Erst nach dem Aufruf dieser Methode soll es möglich sein, auf Objekten von `Bomb` die Methode `explode` aufzurufen.

---
```ruby
class Bomb
  def self.activate
    def explode
      puts "Booooommmmm"
    end
  end
end

b1 = Bomb.new
b2 = Bomb.new
b1.explode # Fehler

Bomb::activate
b1.explode
b2.explode
```


## 10. Vararg-Methoden
Schreiben Sie eine Ruby-Methode `produkt`, die eine beliebige Anzahl von Werten nimmt, miteinander multipliziert und das Ergebnis zurück gibt. Rufen Sie Ihre Methode danach auf.

---
```ruby
def produkt(*p)
  p.reduce { |s, e| s *= e }
end

puts produkt(5, 7, 8, 1)
```



