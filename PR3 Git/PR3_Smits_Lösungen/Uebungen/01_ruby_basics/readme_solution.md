# Aufgabenblock 1: Ruby Grundlagen

Die Aufgaben in dieser Einheit beziehen sich auf die Vorlesungsfolien __Ruby Grundlagen__. 

Folgende Themen werden durch die Aufgaben abgedeckt:

  * Kontrollstrukturen
  * Schleifen
  * Ausdrücke



## 1. Bedingte Zuweisung
Falls in der Variable `a` `nil` stehen sollte, soll dieser der Wert `'leer'` zugeordnet werden, andernfalls soll sie unverändert bleiben. Realisieren Sie dies ohne die Verwendung eines `if`, `while` oder anderer Kontrollstrukturen. Verwenden Sie die _bedingte Zuweisung_.

---
```ruby
a = nil
a ||= 'leer'
```


## 2. Case
Bitte verwenden Sie einen `case`-Ausdruck, um die Schulnoten 1--4 in die entsprechenden Texte "sehr gut", "gut" etc. umzuwandeln. Alle anderen Noten werden als "durchgefallen" behandelt.

---

```ruby
note = 3
text = case note
 when 1 then 'sehr gut'
 when 2 then 'gut'
 when 3 then 'befriedigend'
 when 4 then 'ausreichend'
 else 'durchgefallen'
end
```


## 3. String-Formatierung
Sie haben zwei Variablen `name` und `gewicht` und möchten eine Ausgabe der Form `Peter wiegt 90 kg` erzeugen.

Bitte lösen Sie diese Aufgabe auf _drei_ verschiedenen Wegen

  * Stringverkettung mit `+`
  * Variablenersetzung in Strings mit `#{}`
  * Formatter mit `%`

---

```ruby
name = "Peter"
gewicht = 90

puts name + " wiegt " + gewicht.to_s + " kg"
puts "#{name} wiegt #{gewicht} kg"
puts "%s wiegt %d kg" % [ name, gewicht ]
```

## 4. Parallele Zuweisung
Schreiben Sie eine Ruby-Methode `swap`, der man zwei Werte übergibt und die diese dann vertauscht zurück gibt. Rufen Sie die Methode testweise auf.

---

```ruby
def swap(a, b)
  [ b, a ]
end

x ="Hallo"
y = "Welt"

puts "#{x} #{y}"
x, y = swap(x, y)
puts "#{x} #{y}"
```

## 5. Ranges
Geben Sie alle Zahlen von 1 bis 20 (einschließlich) aus. Verwenden Sie hierzu auf jeden Fall einen _Range_ und eine Iteration mit `each`.

---

```ruby
(1..20).each { |e| puts e }
```

## 6. Splat
Sie haben ein Array mit folgendem Aufbau:

  * Element 0: Breite
  * Element 1: Länge
  * Element 2: Name der Sehenswürdigkeit
  * folgende Elemente: Weitere Informationen

Beispiel:

```ruby
ort = [ 49.468408, 8.482504, \
        'Hochschule Mannheim', \
        'Gebäude A', \
        'Fakultät für Informatik', \
        'Gute Ausbildung' ]
```

Lesen Sie die Elemente in _einem Schritt_ und in _einer einzigen Zuweisung_ in die Variablen `laenge`, `breite`, `name` und `attribute` ein. Verwenden Sie nicht die Indizes, sondern den Splat-Operator (`*`).

---

```ruby
ort = [ 49.468408, 8.482504, \
        'Hochschule Mannheim', \
        'Gebäude A', \
        'Fakultät für Informatik', \
        'Gute Ausbildung' ]

laenge, breite, name, *attribute = ort
```

## 7. Symbole
Verwenden Sie Symbole, um an eine Funktion `ansage` die Ursache für die Verspätung eines Zuges zu übergeben. Mögliche Ursachen sind

  * Signalstörung
  * Personen im Gleis
  * Störungen im Betriebsablauf

Die Funktion soll dann den Text "Wir bitten um Entschuldigung, wegen ... verzögert sich unserer Weiterfahrt", wobei die Punkte durch die Ursache ersetzt werden sollen.

Rufen Sie die Funktion dann mit den verschiedenen Ursachen testweise auf.

---

```ruby
def ansage(ursache)

  text = case ursache
    when :signal
      "Signalstörung"
    when :personen
      "Personen im Gleis"
    when :betrieb
      "Störungen im Betriebsablauf"
    end

  puts "Wir bitten um Entschuldigung, wegen #{text} verzögert sich unsere Weiterfahrt"
end

ansage(:signal)
ansage(:personen)
ansage(:betrieb)
```


