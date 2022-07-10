# Array basics and fundamentals

data = [ 1, 2.0, 4.9, "Filly", "Amey" ]

puts data

data.each{|x| puts x}  

puts data[3]

puts data[-2]

data[0] = "THE MEGA"

puts data

# Push operation in array

data << "Hello World!"

puts data

puts data[-1]

data.pop

puts data