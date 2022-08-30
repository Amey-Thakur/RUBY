# Operator overloading in Ruby
# <", ">", "=" Comparable operators

include Comparable

def <=> (other)
    
    return self.name<=>other.name
    
end

puts "Filly"<=>"Filly"

puts "Filly"<=>"Mega"
