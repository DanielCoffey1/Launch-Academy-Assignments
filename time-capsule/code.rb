puts "Hi! Welcome to the Time Capsule Maker!"
puts "What is your name?"
name = gets.chomp

time_capsule = []

while true
puts "What do you want to add to the time capsule #{name}?"
puts "Type FINISHED (all caps) to stop adding items."
item = gets.chomp
  if item == "FINISHED"
    break
  else
    puts "How many do you want?"
    num_of_items = gets.chomp
    item += " (#{num_of_items})"
    time_capsule << item
  end
end

if time_capsule == []
  puts "Your Time Capsule is empty!"
else
puts "#{name}, thanks for trying our Time Capsule maker. Here is a list of the
items in your Time Capsule!:"
time_capsule.each do |item|
  puts "* #{item}"
  end
end
