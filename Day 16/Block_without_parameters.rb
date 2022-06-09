# Program of Block Without Parameters

def call_block
  puts "Start of method"
  yield
  puts"End of method"
end

call_block do
  puts "Inside the block"
end