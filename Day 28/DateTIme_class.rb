=begin

    Various ways to get Time and Date
    
    1. Time class
    2. Date class
    3. DateTime class
    
    # Date.new(yyyy,mm,dd)
    
    # DateTime.new(yyyy, mm, dd, hh, mm, ss,'TimeZone')

=end


require 'date'

d = Date.new(2022, 07, 20)

puts d


d = Date.new

puts d


d = Date.parse('2000-07-20')

puts d


d = Time.new(2000, 07, 20).to_date

puts d


d = Time.new(2000, 07, 20).to_date

puts d.year


d = Time.new(2000, 07, 20).to_date

puts d.month


d = Date.new(2000, 07, 20).to_date

d = d + 1

puts d


d = Date.parse('20th Juky 2000').to_date

d = d + 1

puts d


dt = DateTime.new(2000, 07, 20, 3, 30, 45, '+0530')

puts dt