# Using Arity method in procs

# This method allows us to find how many arguments a proc object expects to receive

my_proc = Proc.new{|x| "Filly " * x}

puts "Hey Filly...! I need #{my_proc.arity} arguments"

puts my_proc.call(5)


my_proc = Proc.new{|x, y| "Filly " * (x + y) }

puts "Hey Filly...! I need #{my_proc.arity} arguments"


my_proc = Proc.new{|x, *rest| "#{x} and #{rest}"}

puts "Hey Filly...! I need #{my_proc.arity} arguments"


my_proc = Proc.new{|x, *rest| "#{x} and #{rest}"}

puts "Hey Filly...! I need #{~my_proc.arity} arguments and rest are optional"