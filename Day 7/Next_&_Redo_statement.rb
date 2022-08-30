# Next & Redo Statement

# Next statement
for i in 0..5
  if i < 2
    next
  end
  puts "The value of local variable i = #{i}"
end

# Redo statement
for i in 0..5
  if i < 2
    puts "The value of local variable i = #{i}"
    redo
  end
end