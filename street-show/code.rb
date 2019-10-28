knife_juggling = 2.10 + 0.77 + 5.00 + 1.00 + 3.00
puts "Knife Juggling: $" + format("%.2f", knife_juggling)
torch_juggling = 6.00 + 3.50 + 7.00
puts "Torch Juggling: $" + format("%.2f", torch_juggling)
hand_balancing = 2.00 + 1.00
puts "Hand Balancing: $" + format("%.2f", hand_balancing)
human_blockhead = 0.75 + 0.43
puts "Human Blockhead: $" + format("%.2f", human_blockhead)
total_income = knife_juggling + torch_juggling + hand_balancing +
human_blockhead
puts "Total: $" + format("%.2f", total_income)
average_tip_value = total_income / 12
puts "Average Tip Value: $" + format("%.2f", average_tip_value)

#Part 2
puts "Hello everybody! Today, I will be needing a volunteer for my next trick."
puts "There's our brave vounteer! What's your name?"
volunteer_name = gets.chomp
puts "Lets give a big round of applause for " + volunteer_name + "!"
puts "Now " + volunteer_name + ", what is your favorite number?"
number = gets.chomp
puts "Alright " + volunteer_name + ", my friend and I will be juggling these
knives around you for " + number + " seconds. Are you prepared to be amazed?"
