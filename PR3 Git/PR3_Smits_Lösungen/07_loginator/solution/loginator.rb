# Musterlösung für das Assignment 7: Metaprogrammierung

module Loginator

  def logify_me
    # Array für alle Methoden, um diese zwischen zu speichern.
    # Dies ist nötig, weil wir neue Methoden hinzufügen und
    # diese dann als Instant-Methoden auftauchen.
    # Würde man nur über die Instanz-Methoden laufen und sie direkt
    # "logifizieren", würde man auch die neu Hinzugefügten auch sehen
    # und verändern wollen und so nie fertig werden. 
    # Deshalb speichern wir den Urzustand bevor wir überhaupt 
    # mit den Veränderungen anfangen.
    methods = []

    # Alle Instanz-Methoden der Klasse im Array merken.
    # Der Parameter false sorgt dafür, dass wir nur die
    # eigenen Methoden der Klasse bekommen und nicht
    # alle geerbten Methoden, z.B. von Object.
    instance_methods(false).each do |m|
      methods << m
    end

    # Jede Methode durch ihr jeweiliges Logging-Pendant ersetzen
    methods.each do |m|
      add_logging_method(m)
    end
  end

  def add_logging_method(m)
    # Alte Methode retten, indem wir sie in x_org umbenennen.
    # Warum alias_method und nicht alias? Weil man bei alias
    # den Methodennamen nicht dynamisch zusammen bauen kann.
  	alias_method "#{m}_org", "#{m}"

    # Neue Methode definieren, die beliebige Parameter (*a) und
    # Blöcke als Parameter nehmen kann (&b).
    define_method m do |*a, &b|
      # Information ausgeben
      puts "Method #{m}(#{a.join(', ')}) called"

      # Original-Methode mit send rufen. Parameter und Block
      # übergeben und Ergebnis einsammeln.
      r = send "#{m}_org", *a, &b

      # Information ausgeben
      puts "Returned '#{r}'"
    end
  end
end
