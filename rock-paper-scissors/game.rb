puts "Choose rock (r), paper (p), or scissors(s): "
player_input = gets.chomp

rock = "r"
paper = "p"
scissors = "s"

while !(player_input == "r" || player_input == "p" || player_input == "s")
   puts "Invalid choice, enter Rock (r), Paper (p), or Scissors(s)"
   puts "What's your choice?"
   player_input = gets.chomp
end

if player_input == "r"
  puts "Player chose rock."
elsif player_input == "p"
  puts "Player chose paper."
else player_input == "s"
puts "Player chose scissors."
end

computer_input = rand(3)
if computer_input == 0
  computer_input = "r"
  puts "Computer chose rock."
elsif computer_input == 1
  computer_input = "p"
  puts "Computer chose paper."
else computer_input == 2
  computer_input = "s"
  puts "Computer chose scissors."
end

if player_input == computer_input
  puts "Tie Game!"
elsif player_input == "r" && computer_input == "p"
  puts "Paper beats rock. Computer wins!"
elsif player_input == "r" && computer_input == "s"
  puts "Rock beats scissors. You win!"
elsif player_input == "s" && computer_input == "r"
  puts "Rock beats scissors. Computer wins!"
elsif player_input == "s" && computer_input == "p"
  puts "Scissors beats paper. You win!"
elsif player_input == "p" && computer_input == "r"
  puts "Paper beats rock. You win!"
else player_input == "p" && computer_input == "s"
  puts "Scissors beats paper. Computer wins!"
end
