# Inheritance in Ruby

class Person
    
    attr_accessor:name, :age, :trait

end

class Sportsman < Person
    
    attr_accessor:sports

end

sp = Sportsman.new

sp.age = 20
sp.name = "Filly"
sp.sports = "Basketball"

puts sp.inspect
