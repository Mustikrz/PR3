#!/usr/bin/env ruby

require_relative 'vektor.rb'
require 'minitest/autorun'

##
# Test für die Klasse Vektor.
class VektorTest < Minitest::Test

    def test_creation
        vektor = Vektor.new(3, 1, -5)
        assert_equal(3, vektor.x, 0.01)
        assert_equal(1, vektor.y, 0.01)
        assert_equal(-5, vektor.z, 0.01)
    end

    def test_equal
        vektor1 = Vektor.new(5, 7, 9)
        vektor2 = Vektor.new(5, 7, 9)
        vektor3 = Vektor.new(5, 7, 2)
        vektor4 = Vektor.new(5, 3, 9)
        vektor5 = Vektor.new(5, 7, 8)

        assert(vektor1 == vektor2)
        assert(vektor2 == vektor1)
        assert(vektor1 == vektor1)
        assert(vektor2 == vektor2)

        assert(vektor1 != vektor3)
        assert(vektor1 != vektor4)
        assert(vektor1 != vektor5)

        assert(vektor3 != vektor1)
        assert(vektor4 != vektor1)
        assert(vektor5 != vektor1)

    end

    def test_skalar_multiplikation_skalar
        vektor1 = Vektor.new(1, -5,  3)
        ergebnis1 = Vektor.new(6, -30, 18)

        vektor2 = Vektor.new(1, -5,  3)
        ergebnis2 = Vektor.new(-3,  15,  -9)

        assert_equal(ergebnis1, vektor1 * 6)
        assert_equal(ergebnis2, vektor2 * -3)

        vektor3 = Vektor.new(3, 4, 5)
        assert_in_delta(1, vektor3.einheitsvektor.betrag, 0.01)
    end

    def test_einheisvektor
        assert_raises(ArgumentError) { |e| Vektor.new.einheitsvektor }
    end

    def test_skalar_multiplikation_vektor
        vektor1 = Vektor.new(1, 2,  3)
        vektor2 = Vektor.new(-7, 8, 9)
        ergebnis = 36.0

        assert_in_delta(ergebnis, vektor1 * vektor2, 0.0001)

        vektor3 = Vektor.new(-5, 9,  7)
        vektor4 = Vektor.new(10, 3, 8)
        ergebnis2 = 33.0

        assert_in_delta(ergebnis2, vektor3 * vektor4, 0.0001)
    end

    def test_addition_und_subtraktion
        a = Vektor.new( 4,  0,  8)
        b = Vektor.new(-1,  4,  7)
        c = Vektor.new( 3,  4, 15)
        d = Vektor.new( 5, -4,  1)

        assert_equal(c, a + b)
        assert_equal(d, a - b)
        assert_equal(d, (b - a) * -1)
        assert_equal(a + b, b + a)
        assert_equal(a, a + b - b)
    end

    def testBetrag
        a = Vektor.new( 1,  1,  1)
        b = Vektor.new( 2,  0,  0)
        c = Vektor.new( 3,  4,  5)

        assert_in_delta(Math.sqrt(3), a.betrag(), 0.00001)
        assert_in_delta(2, b.betrag(), 0.00001)
        assert_in_delta(Math.sqrt(50), c.betrag(), 0.00001)
    end

    def test_kreuzprodukt
        a = Vektor.new(  1,    2,   3)
        b = Vektor.new( -7,    8,   9)
        c = Vektor.new( -6,  -30,  22)

        assert_equal(c, a % b)
    end
    
    def test_aufgabe1
        a = Vektor.new(2, 0, 5)
        b = Vektor.new(-1, 5, -2)
        c = Vektor.new(2, 1, 2)
        assert_in_delta(-31, b % c * a, 0.001)
    end

    def test_aufgaben2
        a = Vektor.new(1, 2, 8)
        b = Vektor.new(4, 3, 5)
        e = Vektor.new(-14, 27, -5)
        assert_equal(e, a % b)
    end

    def test_aufgabe3
        a = Vektor.new(1, -2, 2)
        b = Vektor.new(3, 2, -4)
        assert_in_delta(-9, a * b, 0.001)
    end

    def test_kollinear
        a = Vektor.new(4,5,7)
        b = Vektor.new(16, 20, 28)
        assert(a.kollinear?(b))

        c = Vektor.new(16, 20, 21)
        assert(!a.kollinear?(c))
    end

    def test_monkeypatch
        vektor1 = Vektor.new(1, -5,  3)
        ergebnis1 = Vektor.new(6, -30, 18)

        vektor2 = Vektor.new(1, -5,  3)
        ergebnis2 = Vektor.new(-3,  15,  -9)

        assert_equal(ergebnis1, 6 * vektor1)
        assert_equal(ergebnis2, -3 * vektor2)
    end
end