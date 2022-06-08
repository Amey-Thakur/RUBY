# Program for Class Variable i.e. @@x with self method

class Filly
  # Initialize our class variables
  @@count = 0;
  def initialize(l,b)
    @length = l
    @breadth = b

    # @@count = @@count + 1
    @@count += 1

  end

  def self.printcount
    puts "Number of objects created is: #{@@count}"
  end
end

# Create two objects
filly1 = Filly.new(30, 10)
filly2 = Filly.new(20, 5)

# Call class method to print box count
Filly.printcount