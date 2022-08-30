# Passing multiple parameters to a single method in Ruby

def sample(*test)
  puts "The number of parameters is #{test.length}"

  for i in 0...test.length
    puts "The parameters are #{test[i]}"
  end
end

sample "Filly", "23", "F", "THE MEGA"
sample "Amey", "22", "M"