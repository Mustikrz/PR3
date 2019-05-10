#!/usr/bin/env ruby
# Bitte schreiben Sie eine einfaches Zahlenratespiel. Das Spiel zieht zufällig eine Zahl
# zwischen 0 und 100 (siehe `Random.rand`). Der Benutzer gibt eine Zahl ein und das
# Spiel sagt, ob die Zahl zu groß oder zu klein war. Rät der Benutzer richtig, beendet
# sich das Spiel und gibt die Anzahl der Versuche aus.
#
range = (1..100)
number = Random.rand(range)
attempt = 0

loop do
  
  attempt += 1

  print("Bitte geben Sie eine Zahl im Bereich #{range} ein: ")
  guess = gets.chomp.to_i

  next  unless range.include?(guess)
  
  if guess < number
    puts 'Zu klein'
  elsif guess > number
    puts 'Zu groß'
  else
    puts "Richtig nach #{attempt} Versuchen."
    break
  end

end
