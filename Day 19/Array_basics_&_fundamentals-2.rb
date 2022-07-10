# Array basics and fundamentals

names = Array.new(6, "Filly...!")

puts names

puts "#{names}"


digits = Array(0...9)

puts digits


digits = Array(0..9)

puts digits

puts digits.at(5)


fruits = ["apple", "banana", "pineapple"]

veggies = ["carrot", "radish", "cabbage"]

edibles = fruits + veggies

puts "Yeah, this fruit is included in the list" if fruits.include?("apple")

puts fruits.first

puts edibles.first

puts edibles.last

puts edibles.first(5)

puts edibles.reverse 

puts fruits.index("banana")

newedibles = edibles - fruits

puts newedibles


x = [2, 1, 3, 23, 8]

puts x.sort

puts x.sort.reverse