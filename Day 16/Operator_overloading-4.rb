# Operator overloading in Ruby
# <", ">", "=" Comparable operators

class Myclass
    
    include Comparable
    attr_accessor:myname
    
    def initialize(name)
        
        @myname = name
        
    end
    
    def <=> (other)
    
    return self.myname<=>other.myname
    
    end
    
end

obj1 = Myclass.new("Filly")
obj2 = Myclass.new("Mega")

puts obj1 > obj2

puts obj1 < obj2

puts obj1 == obj2

puts obj1 != obj2