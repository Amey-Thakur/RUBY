# Array basics and fundamentals

a = ['F', 'i', 'l', 'l', 'y']

print a

print(a[0,5])

print(a[-5,5])

print(a[0..4])

print(a[-5..-1])


b = Array.new(a)

puts b


c= [1, 2, 3, 4]

a.concat(c)

print a


a.delete("i")

print a


a.delete_at(0)

print a


puts a.size


puts a.length


puts a.inspect


puts a.empty?


a.shift

puts a


puts a.equal?(c)


p = [1, 1, 2, 2, 3, 3, 4]  

q = [5, 5, 4, 4, 3, 3, 2]

r = p | q

puts r

r = q | p

puts r

r = p&q

puts r

r = q&p

puts r