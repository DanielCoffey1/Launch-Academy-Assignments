puts "How many sides does your dice have?"
    sides = gets.chomp.to_i

puts "How many times would you like to roll your pair of dice?"
    times_rolled = gets.chomp.to_i

    i = 0
    while i < 1
      times_rolled = times_rolled.times do
      die_one = rand(sides) + 1
      die_two = rand(sides) + 1
      puts "You rolled a #{die_one} and a #{die_two} Total: #{die_one + die_two}"
    end
      puts "Roll again? (y/n)"
      input = gets.chomp.downcase
        if input == 'n'
          exit
        else input == 'y'
          i = 0
        end
      end
