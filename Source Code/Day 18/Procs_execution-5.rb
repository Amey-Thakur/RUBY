# Procs execution and more fundamental concepts

string1 = "Filly"
string2 = "Filly"

puts "Comparison results of strings: #{string1 == string2}"


proc1 = Proc.new{"Filly"}
proc2 = Proc.new{"Filly"}

puts "Comparison results of proc objects: #{proc1 == proc2}"


proc1 = Proc.new{"Filly"}
proc2 = proc1.dup

puts "Comparison results of proc objects: #{proc1 == proc2}"