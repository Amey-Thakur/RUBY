# Procs execution and more fundamental concepts

puts Proc.new{|x| "Filly " * x}.call(2)