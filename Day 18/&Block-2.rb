# Implicit way - using &Block

def my_method(&my_block)
    
    puts "Hello Method"
    
    my_block.call
    
    return my_block
    
end

block_var = my_method{puts "Hello Block"}

block_var.call