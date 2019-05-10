class ZahlenRaten

    require 'securerandom'
    randomNumber = SecureRandom.random_number(100)+1
    #randomNumber = (rand(100) + 1 )

    found = false
    counter = 0

   while found == false
     puts ("Bitte geben Sie eine Zahl zwischen 1 und 100 ein:")
     inputNumber =  gets.to_i     #to.i wandelt String in Zahl um

     if(inputNumber > 100 || inputNumber < 1)
       puts("Zahl muss zwischen 1 und 100 sein")
     else
        counter = counter + 1
        if inputNumber == randomNumber
          puts("Richtig nach #{counter} Versuchen.")
          found = true
          gets() #Damit das Programm nicht ausgeht wenn man richtig liegt
        else
          if inputNumber > randomNumber
            puts("Zu groß")
          else
            puts("Zu klein")
          end
        end
      end
   end
end
