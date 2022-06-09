# program for to_s method

class Rectangle
  def initialize(l,b)
    @l = 50
    @b = 30
  end

  def to_s
    return "Length is #{@l} & breadth is #{@b}"
  end
end

rect = Rectangle.new(20,10)

puts "#{rect}"
puts rect