public class Wortliste

  attr_accessor :array_word, :hash_word, :array_letters, :hash_letters

  def initialize(file)
    s = file.read
    s.downcase!
    @array_word = s.split
    @hash_word = to_hash_word


    @array_letters = Array.new
    i = 0
    while i < s.length
      if s[i] != ' '
        @array_letters[i] = s[i]
      end
      i+=1
    end
    deletespaces = Array.new
    i = 0     #iteriert ueber arrayletters
    j = 0     #iteriert ueber deletespaces
    while i < @array_letters.length
      if @array_letters[i] != nil
        deletespaces[j] = @array_letters[i]
        i+=1
        j+=1
      else
        i+=1
      end
    end
    @array_letters = deletespaces

    @hash_letters = to_hash_letters
  end

  def to_hash_word
    mapped = @array_word.map { |w| [w, 1]}

    reduced = mapped.reduce({}) do |hash, word|
      key = word[0]
      count = word[1]
      hash[key] ||= 0
      hash[key] += count
      hash
    end
  end

  def to_hash_letters
    mapped = @array_letters.map { |w| [w, 1]}

    reduced = mapped.reduce({}) do |hash, word|
      key = word[0]
      count = word[1]
      hash[key] ||= 0
      hash[key] += count
      hash
    end
  end

  ################## Methoden ##################

  def [] (key)
    @hash_word[key]
  end

  def frequency(key)
    (@hash_word[key].to_i) / (count_words.to_i / 1.0)
    (@hash_letters[key].to_i) / (array_letters.to_i / 1.0)
  end

  def count_words
    @array_word.length
  end

  def length
    @hash_word.length
  end

  def to_s

    print ("Analyse der Datei: ")
    print ("Wörter insgesamt: #{@array_word.length}\r\n")
    print ("Unterschiedliche Wörter: #{@hash_word.length}\r\n")

    puts @hash_word
    puts @hash_letters

  end
  
  #Lösung von Herrn Smits
  def each_word
    count = count_words
    array = @liste.to_a.sort { |a, b| -1 * {a[1] <=> b[1]}
    array.each { |e| yield e[0], e[1], FLoat(e[1] / count }
  end    

end



list = Wortliste.new(File.open("liste.txt"))
puts list.to_s