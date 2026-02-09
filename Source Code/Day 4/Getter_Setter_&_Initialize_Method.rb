# Program of Getter, Setter and Initialize Method in Ruby Class

class Rectangle
# Constructor
  def initialize(l,b)
  @length = l
  @breadth = b
  end
  # Setter
  def setLength=(value)
    @length = value
  end
  def setBreadth=(value)
    @breadth = value
  end
  # Getter
  def getLength
    return @length
  end

  def getBreadth
  return @breadth
  end
  # Area of rectangle
  def calculateArea
    return @length * @breadth
  end

end

# Creating an object
rect = Rectangle.new(50,30)
# Using Setters
rect.setLength = 20
rect.setBreadth = 5

# Getter
x = rect.getLength
y = rect.getBreadth

area = rect.calculateArea

puts "The length of rectangle is: #{x}"
puts "The breadth of rectangle is: #{y}"
puts "The area is: #{area}"