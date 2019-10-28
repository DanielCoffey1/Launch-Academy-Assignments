require 'pry'

score = 0
puts "Welcome to the Guessing Game! What difficulty would you like to play?"
puts "Type easy or hard:"
difficulty = gets.chomp
if difficulty == "easy"
  random_number = rand(10) + 1
  puts "I've picked a number between 1 and 10. Now guess it!"
elsif difficulty == "hard"
  random_number = rand(20) + 1
    puts "I've picked a number between 1 and 20. Now guess it!"
end

binding.pry
score += 1
user_guess = gets.chomp

while user_guess != random_number.to_s
  puts "Nope, try again!"
  score += 1
  user_guess = gets.chomp
end

puts "You win! Nice job!"
puts "Your score was: " + score.to_s
