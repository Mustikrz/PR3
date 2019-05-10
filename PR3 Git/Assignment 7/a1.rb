class Loginator
  def self.add_logging
    def log(msg)
      puts ("Die Methode wurde gerufen ") + "#{self} (#{msg})"
    end
  end
end

class A < Loginator
  add_logging
end

a = A.new
a.log("hello")
puts a
