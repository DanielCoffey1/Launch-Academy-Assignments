menu = {
  "Hamburger" => 400,
  "Hot Dog" => 300,
  "Fries" => 200,
  "Chips" => 100,
  "Water" => 125,
  "Soda" => 150
}

items_not_found = nil
items = []
while items_not_found.nil? || !items_not_found.empty?
  puts "Welcome to Goodburger, home of the Goodburger! Can I take your order?
"
  order = gets.chomp
  items = order.split(", ")
  items.each { |item| item.capitalize! }
  items_not_found = items - menu.keys

  if !items_not_found.empty?
    items_not_found.each do |item|
      puts "Sorry! We don't have '#{item}' on the menu."
    end
  end
end

total = 0
items.each do |item|
  total += menu[item]
end

puts "Thanks! Your total is $#{'%.2f' % (total / 100.to_f)}. Have a nice day!"
