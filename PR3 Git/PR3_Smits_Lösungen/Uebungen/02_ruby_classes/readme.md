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



## 2. Klasse deklarieren
Schreiben Sie eine Ruby-Klasse `Ticket`, die Tickets für Fußballspiele repräsentieren kann. Die Klasse soll das Spiel und eine übergreifende Seriennummer speichern.

Versehen Sie die Klasse mit einem Konstruktor, um Instanzen anlegen zu können. Der Konstruktor soll nur das Spiel bekommen, die Seriennummer verwaltet die Klasse selbst und zählt sie für jedes Ticket hoch.

Überschreiben Sie die `to_s`-Methode so, dass man Tickets einfach ausgeben kann.

Sehen Sie eine _statische_ Methode `verkauft` vor, um die aktuell verkaufte Anzahl von Tickets (höchste Seriennummer) auszulesen.

Testen Sie Ihre Klasse, indem Sie Objekte anlegen und ausgeben.



## 3. Default Parameter
Schreiben Sie eine Methode `produkt`, der man 2, 3, oder 4 Zahlen übergeben kann. Die Methode berechnet dann das Produkt und gibt es zurück. Verwenden Sie _Default Parameter_ um diese Methode zu realisieren.



## 4. Vererbung
Schreiben Sie eine Klasse `Mensch`, die den Namen und das Alter eines Menschen speichert. Leiten Sie davon die Klasse `Student` ab, die zusätzlich noch die Matrikelnummer enthält. Sorgen Sie dafür, dass die Objekte bei der Erzeugung korrekt initialisiert werden.

Überschreiben Sie in beiden Klassen sinnvoll die `to_s`-Methode.



## 5. Keyword-Parameter
Schreiben Sie eine Methode `greet`, der man Name und Vorname übergeben kann und die den Aufrufer dann mit "Hello" und dem Vornamen, gefolgt vom Nachnamen begrüßt. Die Reihenfolge der Parameter `vorname` und `nachname` sollen beliebig sein. Verwenden Sie deswegen Schlüsselwort-Parameter.



## 6. Mixin benutzen
Schreiben Sie eine Klasse `Squares`, die das Mixin `Enumerable` einbindet und Quadratzahlen beginnend bei 1 bis zu einer im Konstruktor definierten Obergrenze `max` liefert.



## 7. Modul schreiben
Erstellen Sie ein Modul `Chemie`, das die _Avogadro-Konstante_ (6,02214179 × 10^23) `N_a` und das Molvolumen (22,413996 l/mol) `M_v` enthält. Außerdem soll es eine Methode `volume_o2` enthalten, die für eine gegebene Masse (`m_O`) Sauerstoff das Volumen berechnet. Die Formel hierzu ist `m_O / 32 * M_v`.

Testen Sie das Modul mit eigenen Daten.



## 8. Monkey Patch
Schreiben Sie einen Monkey Patch, der die Klasse `String` um die Methode `to_leet` erweitert. Diese Methode gibt den Inhalt des Strings zurück, macht aber in der Rückgabe vorher die folgenden Ersetzungen: 

  * `a` -> `4`
  * `e` -> `3`
  * `i` -> `1`
  * `o` -> `O`
  * `t` -> `7`




## 9. Geschachtelte Methoden
Schreiben Sie eine Klasse `Bomb`. Diese soll eine statische Methode `activate` haben. Erst nach dem Aufruf dieser Methode soll es möglich sein, auf Objekten von `Bomb` die Methode `explode` aufzurufen.



## 10. Vararg-Methoden
Schreiben Sie eine Ruby-Methode `produkt`, die eine beliebige Anzahl von Werten nimmt, miteinander multipliziert und das Ergebnis zurück gibt. Rufen Sie Ihre Methode danach auf.



