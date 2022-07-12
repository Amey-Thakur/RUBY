# Inheritance in Ruby

class Animal
    
    attr_accessor:color, :name
    
    def identify
        
        return "My name is #{@name} and I am from #{self.class}"
        
    end

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

animal = Animal.new

puts tiger.inspect

puts tiger.speak

puts tiger.identify

puts animal.inspect

puts animal.identify