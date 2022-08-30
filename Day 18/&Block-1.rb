# Implicit way - using &Block

def my_method(&my_block)
    
    puts "Hello Method"
    
    my_block.call
    
end

my_method{puts "Hello Block"}