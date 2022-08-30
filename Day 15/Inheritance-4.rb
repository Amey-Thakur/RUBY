# Inheritance in Ruby

class Animal
    
    attr_accessor:color, :name

end

class Tiger < Animal
    
    def initialize(name, color)
        
        @name = name
        
        @color = color
        
    end
    
    def speak
        return "Grrrr....!!"
        
    end

end

tiger = Tiger.new("Filly", "Blue")

puts tiger.inspect

puts tiger.speak
