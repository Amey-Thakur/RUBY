# Method Overriding - Inheritance in Ruby

class ParentArea
    
    # Constructor
    def initialize(w, h)
        
        @width = w
        @height = h
        
    end
    
    # To calculate the area from Parent Class
    def getArea
        
        return "Area from Parent class is #{@width*@height}"
        
    end

end

class ChildArea < ParentArea
    
     # To calculate the area from Child Class
    def getArea
        
        puts super()
        
        return "Area from Child class is #{@width*@height}"
        
    end
    
end

childobj = ChildArea.new(10, 20)

puts childobj.getArea

