# Program for MODULES

module Mymodule2
  class TestClass
    def initialize
      puts "TestClass Object Created"
    end
    def mymethod
      puts "It is a user defined method."
    end
  end
end

myobject = Mymodule2::TestClass.new
myobject.mymethod