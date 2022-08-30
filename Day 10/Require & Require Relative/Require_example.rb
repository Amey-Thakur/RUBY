require_relative 'classinmodules.rb'
require_relative 'modules.rb'

myobject = Mymodule::TestClass.new
myobject.mymethod

puts Trig::PI

Trig.sinfunction(0)

Moral.sinfunction(Moral::Bad)