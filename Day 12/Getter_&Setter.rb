# Program of Getter, Setter and Initialize Method in Ruby Class

class Rectangle
# Constructor
  def initialize(l,b)
  @length = l
  @breadth = b
  end
  # Getter
  def getLength
    return @length
  end

  def getBreadth
  return @breadth
  end
end

# Creating an object
rect = Rectangle.new(50,30)

# Getter
x = rect.getLength
y = rect.getBreadth

puts "The length of rectangle is: #{x}"
puts "The breadth of rectangle is: #{y}"