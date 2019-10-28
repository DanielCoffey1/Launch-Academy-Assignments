puts "Odd numbers from 1-100"

number = 0
while number <= 100
  if number == 100
    break
  elsif number.odd?
    puts number
  end
  number += 1
end
