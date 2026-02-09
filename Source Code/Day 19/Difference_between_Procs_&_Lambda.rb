# Difference between Procs and Lambda

# Program of a Proc

def my_method
    
        puts "Before Proc"
        
        my_proc = proc{
            
            puts "Inside Proc"
        }
        
    my_proc.call
    
    puts "After Proc"
    
end

my_method



def my_method
    
        puts "Before Proc"
        
        my_proc = proc{
            
            puts "Inside Proc"
            
            return
        }
        
    my_proc.call
    
    puts "After Proc"
    
end

my_method



# Program of a Lambda

def my_method
    
        puts "Before Proc"
        
        my_proc = lambda{
            
            puts "Inside Proc"
        }
        
    my_proc.call
    
    puts "After Proc"
    
end

my_method


def my_method
    
        puts "Before Proc"
        
        my_proc = lambda{
            
            puts "Inside Proc"
            
            return
        }
        
    my_proc.call
    
    puts "After Proc"
    
end

my_method



def my_method
    
        puts "Before Proc"
        
        my_proc = lambda{
            
            puts "Inside Proc"
            
            break
        }
        
    my_proc.call
    
    puts "After Proc"
    
end

my_method