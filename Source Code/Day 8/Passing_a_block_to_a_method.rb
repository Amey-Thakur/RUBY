# Program of Passing a Block to a Method

def filly(&b)
  #yield
  3.times do b.call end
end

filly do
  puts "THE MEGA!"
end