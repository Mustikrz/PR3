 ##
 # Einfache Implementierung eines dreidimensionalen Vektors, der grundlegende
 # Vektor-Operationen unterstützt.
 #
 # Neue Instanzen werden mit Hilfe des Konstruktors erzeugt und initialisiert.
 #
 #
 # vektor = Vektor.new(1, 5, 4);
 #
 # Die Klasse erlaubt es, Vektoren zu addieren, subtrahieren, mit einem skalar
 # oder einem anderen Vektor zu multiplizieren. Weiterhin können auch noch der
 # Betrag und das Kreuzprodukt bestimmt werden.
class Vektor

    attr_accessor :x, :y, :z

    ##
    # Erzeugt einen neuen Vektor mit den angebgebenen Elementen.
    #
    # @param x die x-Komponente des Vektors
    # @param y die y-Komponente des Vektors
    # @param z die z-Komponente des Vektors
    def initialize(x = 0, y = 0, z = 0)
        @x = x
        @y = y
        @z = z
    end

    ##
    # Skalarmultiplikation: Multiplikation des Vektors mit einem Skalar
    # oder einem anderen Vektor.
    #
    # @param skalar mit dem der Vektor multipliziert werden soll
    # @return das Ergebnis der Skalar-Multiplikation
    def *(s)
        if s.kind_of?(Vektor)
            @x * s.x + @y * s.y + @z * s.z
        else
            Vektor.new(@x * s, @y * s, @z * s)
        end
    end

    ##
    # Liefert einen Vektor zurück, der diesem Vektor bezüglich der Richtung
    # entspricht, aber auf die Länge 1 normiert ist.
    #
    # @return den Einheitsvektor zu diesem Vektor
    def einheitsvektor
        if (betrag == 0) 
            raise ArgumentError.new("Vom Nullvektor kann kein " +
            		"Einheitsvektor erzeugt werden.")
        end

        self * (1 / betrag)
    end

    ##
    # Addiert den gegebenen Vektor zu diesem.
    #
    # @param vektor  Vektor der addiert werden soll
    # @return das Eregbnis der Addition    
    def +(vektor)
        Vektor.new(@x + vektor.x, @y + vektor.y, @z + vektor.z)
    end

    ##
    # Subtrahiert den gegebenen Vektor von diesem.
    #
    # @param vektor die matrix die subtrahiert werden soll
    # @return das Eregbnis der Subtraktion
    def -(vektor)
        self + (vektor * -1)
    end

    ##
    # Bestimmt den Betrag (die Länge) dieses Vektors.
    #
    # @return den Betrag (die Länge) des Vektors
    def betrag
        return Math.sqrt(@x*@x + @y*@y + @z*@z)
    end

    ##
    # Bestimmt das Kreuzprodukt dises mit dem gegebenen Vektor.
    #
    # @param v der Vektor mit dem das Kreuzprodukt gebildet werden soll
    # @return das Kreuzprodukt
    def %(v)
        Vektor.new(@y * v.z - @z * v.y, 
                   @z * v.x - @x * v.z, 
                   @x * v.y - @y * v.x)
    end

    ##
    # Bestimmt, ob dieser und der gegebene Vektor kollinear (parallel oder
    # anti-parallel) sind.
    #
    # @param v der andere Vektor
    # @return true wenn die Vektoren kollinear sind, andernfalls false.
    def kollinear?(v)
        Vektor.new == self % v
    end

    def ==(v); (@x == v.x) && (@y == v.y) && (@z == v.z); end
    def to_s; "[ %.2f  %.2f  %.2f ]" % [ x, y, z ]; end
end

class Integer

    alias mul *

    def *(s)
        if s.kind_of?(Vektor)
            s * self
        else
            mul(s)
        end
    end
end
