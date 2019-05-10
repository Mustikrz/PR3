class Vektor
  attr_accessor :x, :y, :z

  #Konstruktor
  def initialize(x,y,z)
    @x = x
    @y = y
    @z = z
  end

  #Ausgabe toString
  def to_s()
    "[ #{self.x}, #{self.y}, #{self.z}]"
  end

  #Addition von Vektoren
  def + (zweiterVektor)
    return Vektor.new(self.x + zweiterVektor.x, self.y + zweiterVektor.y, self.z + zweiterVektor.z)
  end

  #Subtraktion von Vektoren
    def - (zweiterVektor)
      return Vektor.new(self.x - zweiterVektor.x, self.y - zweiterVektor.y, self.z - zweiterVektor.z)
    end

  #Multiplikation zweier Vektoren
  def * (value)
    if value.instance_of?(Integer)
      x = self.x*value
      y = self.y*value
      z = self.z*value
      return Vektor.new(x, y, z)
    elsif value.instance_of?(Vektor)
      x = self.x * value.x
      y = self.y * value.y
      z = self.z * value.z
      return (x + y + z)
    else
      raise 'Ungueltiger Wert fuer Skalarmultiplikation'
    end
  end

  #Kreuzprodukt zweier Vektoren
  def % (zweiterVektor)
    x = (self.y*zweiterVektor.z) - (self.z * zweiterVektor.y)
    y = (self.z*zweiterVektor.x) - (self.x * zweiterVektor.z)
    z = (self.x*zweiterVektor.y) - (self.y * zweiterVektor.x)
    return Vektor.new(x, y, z)
  end

  #Länge eines Vektors
  def betrag
    laenge = Math.sqrt((self.x)**2 + (self.y)**2 + (self.z)**2) # doppeltes "malzeichen" (**) bedeutet hoch
    return laenge
    pus laenge
  end

  #Auslesen einzelner Komponenten x, y und z
  def get(index)
    if index == 0 then puts self.x
    elsif index == 1 then puts self.y
    elsif index == 2 then puts self.z
    else
      puts "ungültigen Index angegeben"
    end
  end

  def einheitsvektor
    if self.x == 0 && self.y == 0 && self.z == 0 then raise ArgumentError end
    self * (1.0 / (self.betrag))
  end

  #Kollinearität
  def kollinear? (zweiterVektor)
      if self.x < zweiterVektor.x
        vielfaches = zweiterVektor.x / self.x
        if (zweiterVektor.y / vielfaches) == self.y && (zweiterVektor.z / vielfaches) == self.z  then return true
        else return false
        end
      elsif zweiterVektor.x < self.x
        vielfaches = self.x / zweiterVektor.x
        if(self.y / vielfaches) == zweiterVektor.y && (self.z / vielfaches) == zweiterVektor.z then return true
        else return false
        end
      end
  end

##########---- Main ---##########
  #vektor1 = Vektor.new(2,2,2)

  #vektor2 = Vektor.new(1,1,2)

  #ergebnis = vektor1*vektor2
  #puts ergebnis.to_s

end



