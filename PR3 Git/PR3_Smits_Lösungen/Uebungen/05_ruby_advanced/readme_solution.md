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

---
```ruby
def analyze(clazz)
  puts "Name:               #{clazz.to_s}"
  puts "Elternklasse:       #{clazz.superclass}"
  puts "Instanz-Methoden:   #{clazz.instance_methods}"
  puts "Statische-Methoden: #{clazz.singleton_methods}"
  puts "Konstanten:         #{clazz.constants}"
end

analyze(String)
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

---
```ruby
def to_leet(s)
  s.gsub(/[aeiot]/, { 'a' => '4', 'e' => '3',
        'i' => '1', 'o' => '0', 't' => '7'})
end

def leet_class(clazz)
  clazz.instance_methods(false).each do |m|
    name = m.to_s
    leet_name = to_leet(name).to_sym
    puts leet_name
    clazz.define_method(leet_name) do |*p|
    end 
  end
end

class M
  def hello; end
  def world; end
end

leet_class(M)

m = M.new
m.h3ll0
m.w0rld
``

## 3. Klasse dynamisch erzeugen
Schreiben Sie eine Funktion `create_class`, der man den die Superklasse übergeben kann. Die Funktion erzeugt dann dynamisch die Klasse und fügt ihr eine Methode `who_am_i` hinzu, die als Text "Ich bin ein Kind von " + den Namen der Superklasse zurückgibt.

---
```ruby
def create_class(super_class)
  Class.new(super_class) do
    def who_am_i
     puts "Ich bin ein Kind von #{self.class.superclass}"
    end
  end
end

Test = create_class(Object)
t = Test.new
t.who_am_i
```

## 4. Methoden dynamisch aufrufen
Schreiben Sie eine Funktion `crazy_caller`, der man ein Objekt übergeben kann. Die Funktion schaut nach, welche Methoden auf dem Objekt aufrufbar sind und ruft dann alle Methoden auf, die keinen Parameter benötigen.

Einige Methoden werden einen Fehler werfen, fangen Sie diesen ab.

---
```ruby
def crazy_caller(obj)
  # Methoden suchen
  obj.methods.each do |m| 
    # m enthält ein Symbol mit dem Namen der Methode,
    # wir wollen aber das Methoden-Objekt
    method = obj.method(m)

    begin
      # Methode aufrufen, wenn sie keinen Parameter hat
      method.call {}  if method.arity == 0
    rescue
    end
  end
end

class Test
  def m1; puts 'm1'; end
  def m2; puts 'm2'; end
  def m3(a); puts 'm3'; end
  def m4(a, b); puts 'm4'; end
end

crazy_caller(Test.new)  
```

## 5. Eigenclass einer Klasse
Fügen Sie der Klasse `Numeric` über deren _Eigenclass_ eine _statische Methode_ `to_binary` hinzu, der man eine Zahl übergibt und diese in binärer Darstellung als String zurück bekommt.

---
```ruby
class Numeric
  class << self
    def to_binary(n)
      n.to_s(2)
    end
  end
end

puts Numeric::to_binary(47)
```

Alternative Lösung:

```ruby
class << Numeric
  def to_binary(n)
    n.to_s(2)
  end
end

puts Numeric::to_binary(47)
```


## 6. Eigenclass eines Objektes
Der unten stehende Code erzeugt zwei Objekte vom Typ `String`. Fügen Sie der _Eigenclass_ von `s2` eine _Methode_ `to_leet` hinzu, die den Inhalt des Objektes in "Leet Speak" ausgibt.

```ruby
s1 = "Hallo"
s2 = "Welt"
```

---
```ruby
s1 = "Hallo"
s2 = "Welt"

class << s2
  def to_leet
    self.gsub(/[aeiot]/, { 'a' => '4', 'e' => '3',
          'i' => '1', 'o' => '0', 't' => '7'})
  end
end

puts s2.to_leet
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

---
```ruby
module Javanator
  def Javanator::javafy
    def toString; to_s; end
  end
end

class Test
  include Javanator
  Javanator::javafy
end

t = Test.new
t.toString
```

## 8. Metaprogrammierung: Die kleine Petze
Schreiben Sie eine Ruby Klasse `Snitch`, deren Objekte man an jede beliebige Ruby-Methode übergeben kann. `Snitch` soll dann auf der Console ausgeben, welche Methoden mit welchen Parametern auf ihm aufgerufen wurden.

---
```ruby
class Snitch
  def method_missing(name, *args, **keywords, &block)
    puts "Aufruf von Methode '#{name}'"
    puts "   mit den Argumenten #{args}"
    puts "   mit den Argumenten #{keywords}"
    puts "   und dem Block #{block}"
  end
end

snitch = Snitch.new
puts snitch
```


## 9. Singleton Methoden
Der unten stehende Code erzeugt zwei Objekte vom Typ `String`. Fügen Sie `s2` eine _Singleton Methode_ `to_leet` hinzu, die den Inhalt des Objektes in "Leet Speak" ausgibt.

```ruby
s1 = "Hallo"
s2 = "Welt"
```

---
```ruby
s1 = "Hallo"
s2 = "Welt"

def s2.to_leet
  self.gsub(/[aeiot]/, { 'a' => '4', 'e' => '3',
        'i' => '1', 'o' => '0', 't' => '7'})
end

puts s2.to_leet
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

---
```ruby
# Klasse (sic!) über Struct erzeugen
Studierender = Struct.new(:vorname, :nachname, :geboren, :matrikel, :fakultaet)

# KLasse noch einmal öffnen und Methode hinzufügen
class Studierender
  def to_s
    matrikel
  end
end

peter = Studierender.new('Peter', 'Meier', '15.03.1998', '123222', 'I')
puts peter
```


