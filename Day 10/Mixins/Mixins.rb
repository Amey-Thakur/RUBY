#Module A
module A
  def a1
    puts "We are in a1 method of Module A"
  end

  def a2
    puts "We are in a2 method of Module A"
  end
end

#Module B
module B
  def b1
    puts "We are in b1 method of Module B"
  end

  def b2
    puts "We are in b2 method of Module B"
  end
end

class Sample
  include A
  include B
end

s = Sample.new
s.a1
s.a2
s.b1
s.b2