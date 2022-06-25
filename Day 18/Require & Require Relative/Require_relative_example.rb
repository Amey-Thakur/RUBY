$LOAD_PATH << '.'

require 'classinmodules.rb'
require 'modules.rb'

myobject = Mymodule::TestClass.new
myobject.mymethod

puts Trig::PI

Trig.sinfunction(0)

Moral.sinfunction(Moral::Bad)