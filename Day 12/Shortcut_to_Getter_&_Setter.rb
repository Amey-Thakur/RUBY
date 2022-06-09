# Shortcut to Getter & Setter 

class Rectangle
  attr_accessor :length, :breadth
end

rect = Rectangle.new

rect.length=50
rect.breadth=30

puts rect.length
puts rect.breadth