transactions = [50_000, -2_000, -25_000, 4_000, -12_000, 5_000, -800, -900,
  43_000, -30_000, 15_000, 62_000, -50_000, 42_000]


# Write Ruby code to find out the answers to the following questions. Be sure to make sure that your output and format matches what is given on the assignment page:

# * What is the value of the first transaction?
puts "The first transaction is:"
puts transactions[0]

# * What is the value of the second transaction?
puts "The second transaction is:"
puts transactions[1]

# * What is the value of the fourth transaction?
puts "The fourth transaction is:"
puts transactions[3]

# * What is the value of the last transaction?
puts "The last transaction is:"
puts transactions[-1]

# * What is the value of the second from last transaction?
puts "The second from the last transaction is:"
puts transactions[-2]

# * What is the value of the 5th from last transaction?
puts "The fifth from the last transaction is:"
puts transactions[-5]

# * What is the value of the transaction with index 5?
puts "The transaction with the index of 5 is:"
puts transactions[5]

# * How many transactions are there in total?
puts "The total number of transactions is:"
puts transactions.length

# * How many positive transactions are there in total?
puts "The total number of positive transactions is:"
counter = 0
transactions.each do |transaction|
  if transaction.to_f > 0.0
    counter += 1
  end
end
puts counter

# * How many negative transactions are there in total?
puts "The total number of negative transactions is:"
counter = 0
transactions.each do |transaction|
  if transaction.to_f < 0.0
    counter += 1
  end
end
puts counter

# * What is the largest withdrawal?
puts "The largest withdrawal is:"
puts transactions.min

# * What is the largest deposit?
puts "The largest deposit is:"
puts transactions.max

# * What is the small withdrawal?
puts "The smallest withdrawal is:"
puts transactions.select(&:negative?).max

# * What is the smallest deposit?
puts "The smallest deposit is:"
puts transactions.select(&:positive?).min

# * What is the total value of all the transactions?
puts "The total value of all the transactions is:"
total_value = 0
transactions.each do |transaction|
  total_value += transaction
end
puts total_value

# * If Dr. Dre's initial balance was $239,900 in this account, what is the value of his balance after his all of the transactions in our transactions array have been run?
puts "Dr. Dre's balance is:"
balance = 239_900
transactions.each do |transaction|
  balance += transaction
end
puts balance

best_records = {
 "Tupac"=>"All Eyez on Me",
 "Eminem"=>"The Marshall Mathers LP",
 "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
 "Led Zeppelin"=>"Physical Graffiti",
 "Metallica"=>"The Black Album",
 "Pink Floyd"=>"The Dark Side of the Moon",
 "Pearl Jam"=>"Ten",
 "Nirvana"=>"Nevermind"
 }

# Write Ruby code to find out the answers to the following questions:

# * How many records are in `best_records`?
puts "Total records:"
puts best_records.size

# * Who are all the artists listed?
puts "All of the artists:"
puts best_records.keys

# * What are all the album names in the hash?
puts "All of the albums:"
puts best_records.values

# * Delete the `Eminem` key-value pair from the list and print an updated list of just the artists.
puts "List of artists with Eminem deleted:"
best_records.delete("Eminem")
puts best_records.keys

# * Add your favorite musician and their best album to the list and print an updated list of all the artists and albums:
puts "My favorite musician added:"
musician = {
  "50 Cent" => "Get Rich or Die Tryin"
}
best_records.merge!(musician).each do |k, v|
  puts "#{k}: #{v}"
end


# * True or False: `Nirvana` is included in `best_records`
puts "True or False: `Nirvana` is included:"
puts best_records.has_key?("Nirvana")


# * Change `Nirvana`'s album to another and then print the updated list of Artists and Albums.
puts "Nirvana's album updated:"
key = "Nirvana"
new_value = "Bleach"
if best_records["Nirvana"] == "Nevermind"
  best_records["Nirvana"] = new_value
end
best_records.each do |k, v|
  puts "#{k}: #{v}"
end

# * True or False: `Soundgarden` is included in `best_records`?
puts "True or False: `Soundgarden` is included:"
puts best_records.has_key?("Soundgarden")

# * If `Soundgarden` is not in `best_records` then add a key-value pair for the band and then print the updated list of Artists and Albums.
puts "Soundgarden added if it's not already there:"
garden = {
  "Soundgarden" => "Superunknown"
}
best_records.merge!(garden)
best_records.each do |k, v|
  puts "#{k}: #{v}"
end


# * Which key-value pairs have a key that has a length less than or equal to 6 characters?
puts "key-value pairs have a key that has a length less than or equal to 6 characters:"
best_records.select{|k, v| k.length < 7}.each do |k, v|
  puts "#{k}: #{v}"
end




# * Which key-value pairs have a value that is greater than 10 characters?
puts "key-value pairs have a value that has a length greater than 10 characters:"
best_records.select{|k, v| v.length > 10}.each do |k, v|
  puts "#{k}: #{v}"
end
