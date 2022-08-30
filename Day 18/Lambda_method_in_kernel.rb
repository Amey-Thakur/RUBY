# Using The Lambda method in Kernel Module

proc_object = lambda{puts "Proc object"}

proc_object.call

puts "Is proc object a lambda - #{proc_object.lambda?}"