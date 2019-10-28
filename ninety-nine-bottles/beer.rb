beer = 100
while beer -= 1
  break if beer == 2
  if beer % 10 == 0
    puts "#{beer} bottles of beer on the wall. #{beer} bottles of beer!"
    puts "Take one down pass it around, #{beer - 1} bottles of beer on the wall.\n"
  else
    puts "#{beer} bottles of beer on the wall. #{beer} bottles of beer."
    puts "Take one down pass it around, #{beer - 1} bottles of beer on the wall.\n"
  end
end
if beer == 2
  puts "#{beer} bottles of beer on the wall. #{beer} bottles of beer."
  puts "Take one down pass it around, #{beer - 1} bottle of beer on the wall.\n"
end
if beer <= 2
  puts "#{beer - 1} bottle of beer on the wall. #{beer - 1} bottle of beer."
  puts "Take one down pass it around, no more bottles of beer on the wall.\n"
end
puts "No more bottles of beer on the wall, no more bottles of beer."
puts "Go to the store and buy some more, 99 bottles of beer on the wall."
