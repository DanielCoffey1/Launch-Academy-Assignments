die_one = rand(6) + 1
die_two = rand(6) + 1
puts "You rolled a #{die_one} and #{die_two}."
puts "Total: #{die_one + die_two}"
puts "Press 'Enter' to roll again, 'S' to stop"

i = 0
while i < 1
  input = gets.chomp.downcase
  if input == 's'
    exit
  else
    die_one = rand(6) + 1
    die_two = rand(6) + 1
    puts "You rolled a #{die_one} and a #{die_two}"
    puts "Total: #{die_one + die_two}"
    puts "Press 'Enter' to roll again, 'S' to stop."
  end
end
