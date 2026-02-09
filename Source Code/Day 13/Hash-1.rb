# Hash in Ruby

countries = {"IN" => "INDIA", 
             "US" => "UNITED STATES", 
             "HU" => "HUNGARY", 
             "UK" => "UNITED KINGDOM", 
             "NO" => "NORWAY", }

puts "The size of the Hash countries is #{countries.size}"

puts countries.keys.inspect

puts countries.values.inspect

countries.each{|k,v| puts "Key: #{k}, Value: #{v}"}

countries.each_pair{|k,v| puts "Key: #{k}, Value: #{v}"}

countries.each_key{|k| puts "Key: #{k}"}

countries.each_value{|v| puts "Value: #{v}"}

newcountries = countries.invert

puts newcountries.keys.inspect

puts newcountries.values.inspect