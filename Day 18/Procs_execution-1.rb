# Procs execution and more fundamental concepts

proc_object = Proc.new{|x| "Filly " * x}

puts proc_object.call(2)