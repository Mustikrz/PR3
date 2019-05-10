class Wortliste

    def initialize
        @liste = {}
        @liste.default = nil
    end

    def <<(wort)
        key = wort.downcase
        frequency = @liste[key] || 0
        frequency += 1
        @liste[key] = frequency
    end

    def length
        @liste.length
    end

    def count_words
        @liste.values.reduce(:+)
    end

    def count_letters
        letters.length
    end

    def [](wort)
        @liste[wort.downcase] || 0
    end

    def frequency(wort)
        Float(self[wort]) / count_words
    end

    def each_word
        count = count_words # for efficency
        array = @liste.to_a.sort { |a, b| -1 * (a[1] <=> b[1]) }
        array.each { |e| yield e[0], e[1], Float(e[1]) / count }
    end

    def letters
        array = @liste.to_a.map { |e| (e[0] * e[1]).chars }
        array.flatten!
    end

    def each_letter(&block)
        array = letters        
        count = count_letters
        hash = array.reduce({}) do |hash, c| 
            hash[c] ||= 1
            hash[c] = hash[c] + 1
            hash
        end

        pairs = hash.to_a.sort { |a, b| -1 * (a[1] <=> b[1]) }
        pairs.each { |e| block.call(e[0], e[1], Float(e[1]) / count) }
    end

    def to_s
        @liste.to_s
    end
end
