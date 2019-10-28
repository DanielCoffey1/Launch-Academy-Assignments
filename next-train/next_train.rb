#train_number = ["Train 1", "Train 2", "Train 3", "Train 4", "Train 5", "Train 6", "Train 7", "Train 8", "Train 9", "Train 10", "Train 11", "Train 12", "Train 13"]
train_time = [2.0, 5.0, 7.5, 8.5, 9.0, 10.0, 11.5, 13.5, 14.5, 17.0, 18.0, 19.0, 24.0]

puts "What time are you leaving?"
input = gets.chomp.to_f

while input > 24 && input < 0
   puts "Invalid input. Please enter a valid time."
  input = gets.chomp.to_f
end

available_trains = train_time.select{|times| times >= input}
available_trains = available_trains.min
train = train_time.index(available_trains) + 1

puts "You should catch Train #{train} leaving at #{available_trains}."
