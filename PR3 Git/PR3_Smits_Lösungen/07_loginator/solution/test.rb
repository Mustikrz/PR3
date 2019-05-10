#!/usr/bin/env ruby
require_relative 'loginator'

class A
  extend Loginator

  def xxxx(p, x, y, z)
    puts p
    "Hugo"
  end
  def yyyy(c)
    puts c
  end
  def blogger
  	yield
  end
  def keyword(a: 0, b: 0)
    a + b
  end

  logify_me 
end

a = A.new


a.xxxx("Huhu", "Hallo", 8, 9)
a.yyyy("Huhu")
a.blogger { puts 'I am a blogger' }
a.keyword(a: 1, b: 1)
