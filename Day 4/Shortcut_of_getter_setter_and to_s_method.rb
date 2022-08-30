# Program for shortcut of getter, setter and also program of to_s method

class Animal
  # Setter & Getter
  attr_accessor :name, :age, :trait

  def to_s
    return "The pet name is #{name}, its age is #{age}, and it is #{trait}"
  end
end

firstAnimal = Animal.new

firstAnimal.name = "Kitty"
firstAnimal.age = 12
firstAnimal.trait = "loudy"

puts firstAnimal.name
puts firstAnimal.age
puts firstAnimal.trait

puts firstAnimal.to_s