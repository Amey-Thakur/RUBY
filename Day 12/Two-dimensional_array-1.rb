# 2D Array

cells = [['a', 'b', 'c', 'd', 'e'],['f', 'g', 'h', 'i', 'j']]

puts cells[1][2]

cells.each do|row|

    row.each do|col|
    
        print col.to_s + " "
    
    end
    
    puts
    
end



cells.each do|row|

    puts row.join(', ')
    
end