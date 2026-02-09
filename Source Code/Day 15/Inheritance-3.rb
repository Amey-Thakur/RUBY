# Inheritance in Ruby

class Animal
    
    attr_accessor:color, :name
    
    def initialize(name, color)
        
        @name = name
        
        @color = color
        
    end

end

class Tiger < Animal
    
    def speak
        return "Grrrr....!!"
        
    end

end

tiger = Tiger.new("Filly", "Blue")

puts tiger.inspect

puts tiger.speak
