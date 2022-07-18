# Using The Proc method in Kernel Module

proc_object = proc{puts "Proc object"}

proc_object.call

puts "Is proc object a lambda - #{proc_object.lambda?}"