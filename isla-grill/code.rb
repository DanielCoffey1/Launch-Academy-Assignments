dinner_total= 178.00
tip = 0.20
tip_total = dinner_total * tip

puts "You should tip $" + format("%.2f", tip_total) + "."
puts "The total bill is $" + format("%.2f", dinner_total + tip_total) + "."
