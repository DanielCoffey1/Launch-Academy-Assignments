# Empty array
crypt_of_civilization = Array.new

#Crypt Filling
crypt_of_civilization << "Comptometer"
crypt_of_civilization << "Box of phonographic records"
crypt_of_civilization << "Plastic savings bank"
crypt_of_civilization << "Set of scales"
crypt_of_civilization << "Toast-O-Lator"
crypt_of_civilization << "Sample of aluminum foil"
crypt_of_civilization << "Donald Duck doll"

#Crypt Combining
extra = ["Container of beer", "Lionel model train set", "Ingraham pocket watch"]
crypt_of_civilization = crypt_of_civilization + extra

#How many items are in the array:
crypt_of_civilization.length

#What is the first item in the array?
crypt_of_civilization[0]

#What is the last item in the array?
crypt_of_civilization[-1]

#What is the second item in the array?
crypt_of_civilization[1]

#What is the third item in the array?
crypt_of_civilization[2]

#What is the second from last item in the array?
crypt_of_civilization[-2]

#What is the index of "Toast-O-Lator"?
crypt_of_civilization.index("Toast-O-Lator")

#Crypt Checking
#Does the array contain "Container of beer"?
#Does the array contain "Toast-O-Lator"?
#Does the array contain "Plastic bird"?
crypt_of_civilization.include?("Container of beer")
crypt_of_civilization.include?("Toast-O-Lator")
crypt_of_civilization.include?("Plastic bird")

#sort by word length
crypt_of_civilization.sort_by { |item| item.length }

#sort in alphabetical order
crypt_of_civilization.sort

#two ways of sorting in reverse alphabetical order
crypt_of_civilization.sort { |a, b| b <=> a }
crypt_of_civilization.sort.reverse

#Crypt Printing
count = 0
while count < crypt_of_civilization.length
  puts crypt_of_civilization[count]
  count += 1
end

crypt_of_civilization.each do |item|
  puts item
end

#Crypt Deletion
#Remove the first item, last item, "set of scales", "sample of aluminum foil"
crypt_of_civilization.shift
crypt_of_civilization.pop
crypt_of_civilization.delete("Set of scales")
crypt_of_civilization.delete("Sample of aluminum foil")
