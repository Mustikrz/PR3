#!/usr/bin/env ruby
require_relative 'wortliste'

# Hauptprogramm
if (ARGV.length != 1)
    puts "Too few arguments!"
    puts "Usage: textanalyse TEXTFILE"
    exit
end

filename = ARGV[0]

puts "Analyse der Dateil '#{filename}'"

word_list = Wortliste.new

File.open(filename, "r:UTF-8").each do |line|

    words = line.split(' ')
    words.each do |word|
        word.gsub!(/[.,":;?–\-!'()]/, "")
        word_list << word 
    end
end

puts ""
puts "Wörter insgesamt:        %6d" % word_list.count_words
puts "Unterschiedliche Wörter: %6d" % word_list.length
puts ""
puts "Rang - Anzahl - Häufigkeit (%) - Wort"

rang = 1

word_list.each_word do |w, h, r| 
    puts "%3d -   %5d   - %5.2f%%       - %s" % [ rang, h, r * 100, w]
    rang += 1
    break  if rang == 11    
end

puts ""
puts "Zeichen insgesamt:        %6d" % word_list.count_letters
puts ""

puts "Rang - Anzahl - Häufigkeit (%) - Wort"

rang = 1

word_list.each_letter do |w, h, r| 
    puts "%3d -   %5d   - %5.2f%%       - %s" % [ rang, h, r * 100, w]
    rang += 1
end

