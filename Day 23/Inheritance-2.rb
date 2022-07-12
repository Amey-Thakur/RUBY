# Inheritance in Ruby

class Animal
    
    attr_accessor:color, :name

end

class Tiger < Animal
    
    def speak
        return "Grrrr....!!"
        
    end

end

tiger = Tiger.new

tiger.color = "Blue"

tiger.name = "Filly"

puts tiger.inspect

puts tiger.speak
