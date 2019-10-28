# Write Ruby<->English answers here as comments in your code

numbers = [28214, 63061, 49928, 98565, 31769, 42316, 23674, 3540, 34953,
  70282, 22077, 94710, 50353, 17107, 73683, 33287, 44575, 83602, 33350, 46583]

# Write Ruby code to find out the answers to the following questions:

# * What is the sum of all the numbers in `array`?
puts "Sum of all numbers in array"
sum = 0
numbers.each do |number|
  sum += number
end
puts sum

# * How would you print out each value of the array?
puts "Each value of the array"
numbers.each do |value|
  puts value
end

# * What is the sum of all of the even numbers?
puts "Sum of all even numbers"
puts numbers.select(&:even?).reduce(:+)

# * What is the sum of all of the odd numbers?
puts "Sum of all odd numbers"
puts numbers.select(&:odd?).reduce(:+)

# * What is the sum of all the numbers divisble by 5?
puts "Sum of all the numbers divisible by 5"
sum = 0
numbers.each do |number|
  if number % 5 == 0
    sum += number
  end
end
puts sum

# * What is the sum of the squares of all the numbers in the array?
puts "Sum of the squares of all numbers in the array"
puts numbers.map{|x| x**2}.reduce(:+)

names = ["joanie", "annamarie", "muriel", "drew", "reva", "belle", "amari",
  "aida", "kaylie", "monserrate", "jovan", "elian", "stuart", "maximo",
  "dennis", "zakary", "louvenia", "lew", "crawford", "caitlyn"]

# Write Ruby code to find out the answers to the following questions:

# * How would you print out each name backwards in `array`?
puts "Each name backwards"
puts names.reverse

# * What are the total number of characters in the names in `array`?
puts "What are the total number of characters in the names?"
puts names.join.size

# * How many names in `array` are less than 5 characters long?
puts "How many names are less than 5 characters long?"
counter = 0
names.each do |name|
  if name.length < 5
    counter += 1
  end
end
puts counter

# * How many names in `array` end in a vowel?
puts "How many names end in a vowel?"
vowels = ["a", "e", "i", "o", "u"]
counter = 0
names.each do |name|
  if vowels.include?(name[name.length - 1])
  counter += 1
  end
end
puts counter

# * How many names in `array` are more than 5 characters long?
puts "How many names are more than 5 characters long?"
counter = 0
names.each do |name|
  if name.length > 5
    counter += 1
  end
end
puts counter

# * How many names in `array` are exactly 5 characters in length?
puts "How many names are exactly 5 characters long?"
counter = 0
names.each do |name|
  if name.length == 5
    counter += 1
  end
end
puts counter
