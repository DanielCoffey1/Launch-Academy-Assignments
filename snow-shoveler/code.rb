width = 8
length = 20
height = 8.0/12.0

cubic_feet = width * length * height

if cubic_feet < 50
  total_price = 20
elsif cubic_feet < 150
  total_price = 50
elsif cubic_feet < 300
  total_price = 100
else
  total_price = 150
end

puts "Cubic Feet: #{cubic_feet} cubic ft"
puts "Quote Price: $#{total_price}"
