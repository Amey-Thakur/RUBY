# Program for Modules

module Trig

  PI = 3.14159265359

  def Trig.sinfunc(x)
    puts Math.sin(x)
  end
  def Trig.cosfunc(x)
    puts Math.cos(x)
  end
end

module Moral

  Very_bad = 0
  Bad = 1

  def Moral.sinfunc(badnesslevel)
    if (badnesslevel == 0)
      puts "THE MEGA is very bad"
    else
      puts "Amey is little bad"
    end
  end
end

puts Trig::PI

Trig.sinfunc(0)

Moral.sinfunc(Moral::Bad)