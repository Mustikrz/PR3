#!/usr/bin/env ruby
require_relative "crypter_scrypt"

if __FILE__ == $0 # Erlaubt inkludierung mit require
  # Hauptprogramm
  if (ARGV.length == 1)
    puts hash_password(ARGV[0])
  elsif (ARGV.length == 2)
    if test_password(ARGV[0], ARGV[1])
      puts "Korrekt"
      exit 0
    else
      puts "Falsch"
      exit 1
    end
  else
    puts "Too few arguments!"
    puts "Usage: crypter PASSWORD [HASH]"
    exit
  end
end