# Various ways to initialize the time object

# Time.new(YYYY, mm, dd, hh, mm, ss, 'Time Zone')

time = Time.new(2022, 7, 20, 21, 30, 45, '+05:30')

puts time


time = Time.new(2022, 7, 20, 21, 30, 45)

puts time


time = Time.new(2022, 7, 20)

puts time


time = Time.new(2022)

puts time


time = Time.new

puts time


puts time.year

puts time.month

puts time.day

puts time.hour

puts time.min

puts time.sec

puts time.wday

# 0 - sunday
# 1 - monday
# 2 - tueday
# 3 - wednesday
# 4 - hursday
# 5 - friday
# 6 - saturday

puts time.yday

puts time.usec


puts time.thursday?

puts time.sunday?


puts time.dst? # Day light saving time


puts time.subsec


puts time.to_a


puts time.to_i


puts time.to_f


time2 = time + 259200

puts time2


puts time<=>time2

puts time2<=>time

puts time2<=>time2

puts time.eql?(time2)

puts time == time2

puts time < time2

puts time > time2