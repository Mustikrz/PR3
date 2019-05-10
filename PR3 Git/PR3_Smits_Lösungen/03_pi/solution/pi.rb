#!/usr/bin/env ruby
require 'chunky_png'

pi = File.read("#{ARGV[0]}.txt").chomp

WIDTH = 1000
HEIGHT = 1000

# Creating an image from scratch, save as an interlaced PNG
png = ChunkyPNG::Image.new(WIDTH, HEIGHT, ChunkyPNG::Color::TRANSPARENT)

xpos = 0
ypos = 0

pi.each_char do |c|

  next if c == "\n"
   
  value = c.to_i
  
  w = Integer((255.0 / 9) * value)

  if xpos >= WIDTH
    ypos += 1
    xpos = 0
  end

  if ypos >= HEIGHT
    break
  end

  png[xpos, ypos] = ChunkyPNG::Color.rgba(w, w, w, 255)

  xpos += 1
end

png.save("#{ARGV[0]}.png", :interlace => false)

