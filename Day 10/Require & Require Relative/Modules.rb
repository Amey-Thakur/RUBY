#code for module

module Trig
  PI = 3.14

  def Trig.sinfunction(x)
    puts Math.sin(x)
  end
  def Trig.cosfunction(x)
    puts Math.cos(x)
  end
end

module Moral
  Very_bad = 0
  Bad = 1
  def Moral.sinfunction(badnesslevel)
    if (badnesslevel == 0)
      puts 'You are very bad'
    else
      puts 'You are just bad'
    end
  end
end

puts Trig::PI
Trig.sinfunction(0)

Moral.sinfunction(Moral::Bad)