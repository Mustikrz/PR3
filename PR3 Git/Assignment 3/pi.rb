require 'chunky_png'
#Daten einlesen

filePi = File.open("pi.txt")
fileCat = File.open("secret.txt")
piNumber = filePi.read.split.join     #split.join entfernt die leerzeichen
numberCat = fileCat.read.split.join     #split.join entfernt die leerzeichen
filePi.close
fileCat.close

#Erzeugen der PNG Datei
pngPi = ChunkyPNG::Image.new(1000, 1000, ChunkyPNG::Color::TRANSPARENT)
pngCat = ChunkyPNG::Image.new(1000, 1000, ChunkyPNG::Color::TRANSPARENT)

i = 0
horizontal = 0
vertikal = 0

while(vertikal<1000)
  farbIndexPi = 255.0/9.0 * piNumber[i].to_f
  colorPi = farbIndexPi.to_i

  farbIndexCat = 255.0/9.0 * numberCat[i].to_f
  colorCat = farbIndexCat.to_i

  pngPi[horizontal, vertikal] = ChunkyPNG::Color.rgb(colorPi,colorPi,colorPi)
  pngCat[horizontal, vertikal] = ChunkyPNG::Color.rgb(colorCat,colorCat,colorCat)
  horizontal += 1
  i += 1

  if(horizontal == 1000)
    vertikal += 1
    horizontal = 0
  end
end
pngPi.save('chunky.png', :interlace => true)
pngCat.save('cat.png', :interlace => true)