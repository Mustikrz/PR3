# Aufgabenblock 3: Ruby Container

Die Aufgaben in dieser Einheit beziehen sich auf die Vorlesungsfolien __Container, Blöcke und Iteratoren__. 

Folgende Themen werden durch die Aufgaben abgedeckt:

  * Arrays
  * Hashes
  * Blöcke
  * Iteratoren


## 1. Arrays
Simulieren Sie ein Kartendeck mit Hilfe von Arrays. Jede Karte wird durch ein Ruby-Symbol repräsentiert das aus zwei Zeichen besteht. Das erste Zeichen repräsentiert die Farbe (P, X, H, K), das zweite den Wert (7, 8, 9, 0, B, D, K, A).

  * Erzeugen Sie einen vollständigen Kartenstapel mit 32 Karten.
  * Mischen Sie die Karten.
  * Nehmen Sie 5 Karten von oben und 5 Karten von unten ab und legen Sie sie in einen neuen Stapel
  * Mischen Sie die abgenommenen Karten und legen Sie diese wieder auf den Stapel



## 2. Callback mit Block
Schreiben Sie eine Funktion `rechner`, der man einen Block übergeben kann. `rechner` übergibt dem Block zwei Zahlenwerte und erwartet eine Zahl zurück. Das Ergebnis wird verdoppelt und von `rechner` zurück gegeben.

Beispiel:

```ruby
puts rechner(5, 4) { |a, b| a + b }
# -> 18
puts rechner(5, 4) { |a, b| a - b }
# -> 2
```



## 3. Callback mit Proc
Schreiben Sie eine Funktion `rechner`, der man einen Block, ein Lambda oder ein Proc-Objekt übergeben kann. `rechner` übergibt dem Block/Proc/Lambda zwei Zahlenwerte und erwartet eine Zahl zurück. Das Ergebnis wird verdoppelt und von `rechner` zurück gegeben.

Beispiel:

```ruby
lam = ->(a, b) { a + b }
puts rechner(5, 4, lam) # -> 18
```



## 4. Closure
Schreiben Sie eine Ruby-Funktion `create_counter`, die ein Proc-Object zurück gibt. Das Proc-Objekt soll bei jedem Aufruf eine aufsteigende Zahl zurückgeben.

Beispiel:
```ruby
p = create_counter
puts p.call # -> 1
puts p.call # -> 2
```



## 5. Hashes
Gegeben sei ein Array mit einigen Begriffen (siehe unten). Bitte schreiben Sie eine Funktion `de_dupe`, die ein solches Array mit Strings bekommt, die Duplikate entfernt und danach das Array sortiert wieder zurück gibt. Die Funktion soll intern mit einem _Hash_ arbeiten.

```ruby
worte = %w{ Bier Schnaps Bier Vodka \
      Rum Baileys Rum Bier Vodka Bier Hugo }
```



## 6. Hashes und Blöcke
Realisieren Sie einen einfachen _Cache_ mit Hilfe von _Hashes_. Schreiben Sie hierzu eine Klasse `Cache`. 

Die Klasse `Cache` hat eine Methode zum Hinzufügen von Elementen (`add`) und eine zum Auslesen (`[]`), wobei jeweils ein String als Schlüssel verwendet wird. 

Wenn ein Element nicht enthalten sein sollte, liefert die Methode `[]` nicht `nil` zurück, sondern ruft einen Block auf, der im Konstruktor der Klasse übergeben wurde. Diese Block beschafft die Daten und gibt sie zurück.

Eine beispielhafte Benutzung sähe dann wie folgt aus:

```ruby
c = Cache.new { |key| "Neuer Wert für key #{key}" }
c.add 'key1', 'value1'
c.add 'key2', 'value2'
puts c['key1'] # -> 'value1'
puts c['key3'] # -> 'Neuer Wert'
```



## 7. Map
Schreiben Sie eine Methode `leeter`, der man ein Array von Strings übergibt und die ein Array mit den entsprechenden Strings in _"Leet Speak"_ zurück gibt. Verwenden Sie hierzu die `map`-Methode.



## 8. Map und Reduce
Schreiben Sie eine Methode `char_count`, der man eine Reihe von Strings übergeben kann und die am Ende die Summer der Anzahl der Zeichen in allen Strings zurück gibt. Verwenden Sie hierzu sowohl die `map`- als auch die `reduce`-Methode.



