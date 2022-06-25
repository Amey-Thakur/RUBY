# class in module

module Mymodule
  class TestClass

    def initialize
      puts "TestClass object created"
    end

    def mymethod
      puts "It is a user defined method"
    end
  end
end

myobject = Mymodule::TestClass.new
myobject.mymethod