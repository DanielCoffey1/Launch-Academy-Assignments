# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

# parties_attributes = [
#   {name: 'Boston Tea Party', location: 'England', description: 'It\'s a tea party yo! Bring your crumpets.'},
#   {name: 'Halloween Bash', location: 'Some barn somewhere?', description: 'Sounds terrible.'}
# ]
#
# parties_attributes.each do |party|
#   party = Party.create(party)
# end


friends_attributes = [
  {first_name: 'Daniel', last_name: 'Coffey'},
  {first_name: 'Tom', last_name: 'Brady'}
]

friends_attributes.each do |friend|
  friend = Friend.create(friend)
end
