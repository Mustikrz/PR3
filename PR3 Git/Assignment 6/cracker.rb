#!/usr/bin/env ruby
require_relative 'crypter'
require_relative 'crypter_mb5'

#################################################################################
# Leider haben wir das mit dem Brute Forcen nicht hinbekommen :)
# #################################################################################

if ARGV.length == 3
  #Daten einlesen
  fileWortliste = File.open(ARGV[1])
  wortliste = fileWortliste.read.split(" ")

  print("Teste gegen Wortliste #{ARGV[1]}\n")       #Argv[1] = in der Commandzeile das zweite übergebene
  startzeit = Time.now
  wortliste.each do |words|
    if test_password(words,ARGV[0])
      puts "Das gefundene Passwort lautet: " + words
      puts "Laufzeit: #{Time.now - startzeit}s"
      exit 0
    end
  end

  print("Teste #{ARGV[1]} mit Modifikationen aus  #{ARGV[2]}\n")
  startzeit = Time.now
  neue_wortliste = Array.new
  File.open(ARGV[2]) do |zeile|
    zeile.each_line do
      wortliste.each_index do |i|
        neue_wortliste << wortliste[i].gsub(/[elt$]/, 'e' =>'3', 'l' => '1', 't'=> '7', '$' => '!')
        neue_wortliste << wortliste[i].gsub(/e/, '3')
        neue_wortliste << wortliste[i].gsub(/l/, '1')
        neue_wortliste << wortliste[i].gsub(/t/, '7')
        neue_wortliste << wortliste[i].gsub(/$/, '!')
      end
    end
  end
  neue_wortliste.each do |words|
    if test_password(words,ARGV[0])
      puts "Das gefundene Passwort lautet: " + words
      puts "Laufzeit: #{Time.now - startzeit}s"
      exit 0
    end
  end
end