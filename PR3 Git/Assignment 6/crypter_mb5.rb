#!/usr/bin/env ruby
require "digest"
require "base64"
require "securerandom"

##
# Erzeugt zu einem gegebenen Passwort einen gehashten Eintrag,
# der z.B. in der Nutzerdatenbank gespeicher werden könnte
# @param [String] password das Password, das gehasht werden soll
def hash_password(password)
  # Generate a salt
  salt = SecureRandom.random_bytes(16)

  # Generate full hash
  "%s|%s" % [ Base64.strict_encode64(salt), hash(salt, password) ]
end

##
# Testet, ob das angegebene Klartext-Passwort zum Hash passt
# @param [String] password Klartext-Passwort
# @param [String] hash_password Passwort-Hash, wie von hash_password erzeugt
def test_password(password, hashed_password)
  salt, stored_hash = hashed_password.split('|')
  input_hash = hash(Base64.strict_decode64(salt), password)
  stored_hash === input_hash
end

##
# Interne Funktion, um mit scrypt ein hash zu berechnen
def hash(salt, password)
  hash = Digest::MD5.hexdigest(password + Base64.strict_encode64(salt))
  Base64.strict_encode64(hash)
end

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