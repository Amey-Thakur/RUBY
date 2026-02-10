# Program of Block With Parameters

def call_block
  puts "Start of method"
  yield("Filly", "2022")
  puts"End of method"
end

call_block do
  |str, num| puts "Inside the block: " +str+" "+ num.to_s
end