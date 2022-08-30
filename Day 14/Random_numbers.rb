# Random numbers in Ruby

puts rand   # 0 - 0.99

puts rand*10    # 0 - 0.99

puts (rand*10).to_i     # Integer

puts (rand*30 + 10).to_i     # Integer between 10 to 30

puts rand(10)   #0 - 9

puts rand(10)+1

puts rand(0..10)    # Include 10

puts rand(0...10)   # Exclude 10

puts (0..5).map{rand(0..10)}

puts (0...5).map{rand(0..10)}

puts (0...5).map{rand(0..20)}



# srand

srand 1234

puts rand

srand 1234

puts rand


srand 1234

puts rand, rand

srand 1234

puts rand, rand


srand 1234

puts rand(10), rand(100)

srand 1234

puts rand(10), rand(100)# Random numbers in Ruby

puts rand   # 0 - 0.99

puts rand*10    # 0 - 0.99

puts (rand*10).to_i     # Integer

puts (rand*30 + 10).to_i     # Integer between 10 to 30

puts rand(10)   #0 - 9

puts rand(10)+1

puts rand(0..10)    # Include 10

puts rand(0...10)   # Exclude 10

puts (0..5).map{rand(0..10)}

puts (0...5).map{rand(0..10)}

puts (0...5).map{rand(0..20)}



# srand

srand 1234

puts rand

srand 1234

puts rand


srand 1234

puts rand, rand

srand 1234

puts rand, rand


srand 1234

puts rand(10), rand(100)

srand 1234

puts rand(10), rand(100)