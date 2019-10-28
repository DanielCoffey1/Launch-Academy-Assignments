puts "Enter your values here!"

total = 0.0
while total < 100 do
  print "> "
  input = gets.chomp.to_f
  total = total + input
end

puts "You've reached 100!"

#Part 2
if total >=125
  twenty_five_mores = ((total - 100) / 25).to_i
  twenty_five_mores.times do
    puts "You've earned another 25!"
  end
end
