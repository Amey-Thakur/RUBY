# Operator overloading in Ruby
# <", ">", "=" Comparable operators

include Comparable

def <=> (other)
    
    return self.value<=>other.value
    
end

puts "Filly"<=>"Filly"

puts "Filly"<=>"Mega"

puts 10<=>20

puts 100<=>20
