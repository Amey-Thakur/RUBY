# 2D Array - Create 10*10 2D array with each element as "0"

box = []

10.times do |row|
    
    box[row] = []
    
    10.times do
        
        box[row] << 0
    
    end
    
end


for row in box
    
    puts (row.inspect)
    
end