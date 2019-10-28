puts "Hello, I'm the first and only Talking Vending Machine."
puts "What would you like today"
input = gets.chomp
puts "How many of those would you like?"
num = gets.chomp

if num.include? "tons"
  14.times do
    puts "#{input}"
  end
end
if num != "tons"
num.to_i.times do
  puts "#{input}"
  end
end
puts "There you go! Come again!"
