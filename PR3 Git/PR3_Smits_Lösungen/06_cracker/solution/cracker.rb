#!/usr/bin/env ruby
require_relative 'crypter.rb'

# Hauptprogramm
if (ARGV.length < 3)
    puts "Too few arguments!"
    puts "Usage: cracker HASH WORD-FILE TRANSFORM-FILE [-v]"
    exit
end

hash = ARGV[0]
wordlist_file = ARGV[1]
transform_file = ARGV[2]
verbose = ARGV.length == 4 && ARGV[3] == "-v"

# Step 1: Common words

puts "Teste gegen Worliste #{wordlist_file}\n\n"

starting = Time.now

File.open(wordlist_file, "r:UTF-8").each do |line|

    word = line.chomp

    puts "\033[1ATeste: " + word + " " * (70 - word.length)  if verbose

    #puts line
    if test_password(word, hash)
        puts "\nGefunden: " + word
        exit
    end
end

puts "Laufzeit: %.2f s" % (Time.now - starting)

# Step 2: Common words - transmogrified

puts "\nTeste #{wordlist_file} mit Modifikationen aus #{transform_file}\n\n" 

# Read transformations
transformations = []

File.open(transform_file, "r:UTF-8").each do |line|
    elements = line.split(' ')
    transformations << [ Regexp.new(elements[0].gsub(/\//, "")), elements[1] ]
end

starting = Time.now

# Test words (with transformations)
File.open(wordlist_file, "r:UTF-8").each do |line|
    
    line = line.chomp
    
    transformations.each do |t|
        word = line.gsub(t[0], t[1])

        # Test only real modifications
        if word == line
            next
        end

        puts "\033[1ATeste: " + word + " " * (70 - word.length)  if verbose

        if test_password(word, hash)
            puts "\nGefunden: " + word
            exit
        end
    end
end

puts "Laufzeit: %.2f s" % (Time.now - starting)

# Step 3: Brute force
starting = Time.now

for i in 1..8 do

    puts "\nBrute Force Angriff Länge #{i}\n\n"
    starting = Time.now

    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890.:-_,;!\"§$%&/()=?ß`´*+'#"
        .chars
        .repeated_permutation(i)
        .lazy
        .map(&:join)
        .each do |word|

            puts "\033[1ATeste: " + word + " " * (70 - word.length)  if verbose

            if test_password(word, hash)
                puts "\nGefunden: " + word.chomp
                puts "Laufzeit: %.2f s" % (Time.now - starting)
                exit
            end
        end

    puts "Laufzeit: %.2f s" % (Time.now - starting)
end

