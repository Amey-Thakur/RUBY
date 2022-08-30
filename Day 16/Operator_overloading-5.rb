# Operator overloading in Ruby
# +", "-", "*", "/", "*", "%", "**" Operators

class Tester
    
    attr_accessor:num
    
    def initialize(num)
        
        @num = num
        
    end
    
    def +(other)
        
        return self.num+other.num
        
    end
    
    def *(other)
        
        return self.num*other.num
        
    end
    
    def /(other)
        
        return self.num/other.num
        
    end
    
    def %(other)
        
        return self.num%other.num
        
    end
    
    def **(other)
        
        return self.num**other.num
        
    end
    
end

a = Tester.new(5)
b = Tester.new(3)

puts a+b

puts a*b

puts a/b

puts a%b

puts a**b
