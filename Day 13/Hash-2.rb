# Hash in Ruby

names = Hash.new

names["clever"] = "Filly"
names["hot"] = "Mega"
names["funky"] = "Amey"
names["sporty"] = "Hasan"

puts names["hot"]

puts names.fetch("funky")

puts names.values_at("clever", "sporty")


# For keys availability

puts names.has_key?("clever")

puts names.has_key?("nerd")

puts names.key?("funky")

puts names.include?("swimmer")

puts names.include?("sporty")


# For values availability

puts names.has_value?("Filly")

puts names.has_value?("Julia")

puts names.value?("hot")


# Duplicate the hashes

names2 = names.dup

puts names2.values.inspect

puts names.eql?(names2)

puts names2.empty?

names2.clear

puts names2.empty?