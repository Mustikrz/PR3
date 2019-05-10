require 'minitest/autorun'
require_relative 'vektor'

class Vektor_test < Minitest::Test

    def test_multiplikationMitSkalar
        skalar1, skalar2 = 6, -3
        assert_equal (Vektor.new(1, -5, 3) * skalar1).to_s, "[ 6, -30, 18]"
        assert_equal (Vektor.new(1, -5, 3) * skalar2).to_s, "[ -3, 15, -9]"
    end

    def test_skalarproduktZweierVektoren
        assert_equal (Vektor.new(1, 2, 3) * Vektor.new(-7, 8, 9)), 36
        assert_equal (Vektor.new(-5, 9, 7) * Vektor.new(10, 3, 8)), 33
    end

    def test_additionUNDsubtraktion
        assert_equal (Vektor.new(4, 0, 8) + Vektor.new(-1, 4, 7)).to_s, "[ 3, 4, 15]"
        assert_equal (Vektor.new(4, 0, 8) - Vektor.new(-1, 4, 7)).to_s, "[ 5, -4, 1]"
    end

    def test_kreuzprodukt
        assert_equal (Vektor.new(1, 2, 3) % Vektor.new(-7, 8, 9)).to_s, "[ -6, -30, 22]"
        assert_equal (Vektor.new(1, 2, 8) % Vektor.new(4, 3, 5)).to_s, "[ -14, 27, -5]"
    end

    def test_betrag
        assert_equal (Vektor.new(5, 4, 3).betrag), Math.sqrt(50)
        assert_equal (Vektor.new(1, 1, 1).betrag), Math.sqrt(3)
    end

    def test_kollinear
        assert_equal (Vektor.new(4, 5, 7).kollinear?(Vektor.new(16, 20, 28))), true
        assert_equal (Vektor.new(4, 5, 7).kollinear?(Vektor.new(16, 20, 21))), false
    end

    def test_komplexereRechung
        assert_equal (Vektor.new(-1,5,-2) % Vektor.new(2,1,2)) * Vektor.new(2,0,5), -31
    end

end