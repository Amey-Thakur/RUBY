# Hash in Ruby

names = Hash.new

names["clever"] = "Filly"
names["hot"] = "Mega"
names["funky"] = "Amey"
names["sporty"] = "Hasan"

names.delete("sporty")

puts names.inspect

names.shift

puts names.inspect

names.delete_if{|key, value| key == "hot"}

puts names.inspect



people = Hash.new

people.store("dwarf", "Filly")
people.store("tall", "Mega")
people.store("short", "Amey")


# Merge Function

myhash = names.merge(people)

puts myhash.inspect


# Merge! function

myhash = names.merge!(people)

puts myhash.inspect

puts names.inspect

puts people.inspect


# Update function and Merge! function are synonyms

myhash = names.update(people)

puts myhash.inspect

puts names.inspect

puts people.inspect


# assoc function

puts names.assoc("tall")

puts names.assoc("Mega").inspect # Null value


# rassoc function

puts names.assoc("tall") # Null value

puts names.rassoc("Mega").inspect 
