# Freezing Objects

class Mouse
    
    attr_accessor:tail_length, :height
    
    def initialize(t,h)
        
        @tail_length = t
        @height = h
        
    end
    
end

mouse = Mouse.new(5, 10)

puts mouse.tail_length

puts mouse.height


mouse.freeze

if(mouse.frozen?)
    
    puts "Yes! Mouse is frozen"
    
else
    
    puts "Mouse is free to move"
    
end

