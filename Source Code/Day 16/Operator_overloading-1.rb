# Operator overloading in Ruby

class Animal
    
    attr_accessor:name, :trait
    
    def initialize(name, trait)
        
        @name = name
        @trait = trait
        
    end
    
    def +(other_object)
        
        return Animal.new("#{self.name}#{other_object.name}", "#{self.trait}#{other_object.trait}")
        
    end
    
end

class Zebra < Animal
    
end 

a = Zebra.new("Filly", "Brave")

b = Zebra.new("Mega", "Smart")

puts (a + b) .inspect
