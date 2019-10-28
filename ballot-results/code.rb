vote_results = []
4.times do |precinct_index|
  vote_results[precinct_index] = []
  3.times do |candidate_index|
    vote_results[precinct_index][candidate_index] = rand(20..500)
  end
end

candidates = [
  'Mary Sue',
  'Sally Jane',
  'Billy Joe'
]

vote_results.each_with_index do |precinct_results, precinct_index|
  puts "In precinct #{precinct_index + 1}:"

  candidates.each_with_index do |candidate, candidate_index|
    puts "* #{candidate} got #{vote_results[precinct_index][candidate_index]} votes"
  end

  puts ""
end


precinct_one_sum = 0
vote_results[0].each do |votes|
  precinct_one_sum += votes
end

puts "Precinct 1 had #{precinct_one_sum} votes"

max_votes = vote_results[3].max
candidate_index = vote_results[3].index(max_votes)

puts "#{candidates[candidate_index]} won Precinct 4"

mary_sue_votes = 0
billy_joe_votes = 0
sally_jane_votes = 0
vote_results.size.times do |precinct_index|
  mary_sue_votes += vote_results[precinct_index][0]
  sally_jane_votes += vote_results[precinct_index][1]
  billy_joe_votes += vote_results[precinct_index][2]
end

puts "Mary Sue had #{mary_sue_votes} votes"
puts "Billy Joe had #{billy_joe_votes} votes"
puts "Sally Jane had #{sally_jane_votes} votes"

total_votes = mary_sue_votes + billy_joe_votes + sally_jane_votes
puts "There were #{total_votes} votes in total"

if mary_sue_votes > billy_joe_votes && mary_sue_votes > sally_jane_votes
  puts "Mary Sue had the most votes (#{mary_sue_votes})"
elsif billy_joe_votes > mary_sue_votes && billy_joe_votes > sally_jane_votes
  puts "Billy Joe had the most votes (#{billy_joe_votes})"
else
  puts "Sally Jane had the most votes (#{sally_jane_votes})"
end
