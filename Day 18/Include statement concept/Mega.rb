# Include Statement

require_relative "Filly.rb"

class Decade
  include Week
  $no_of_years = 10

  def no_of_months
    puts "Today is " + Week::First_Day

    number = $no_of_years * 12
    puts "No. of months in 10 years is " + number.to_s
  end
end

d1 = Decade.new

puts Week::First_Day

Week.weeks_in_month
Week.weeks_in_year

d1.no_of_months