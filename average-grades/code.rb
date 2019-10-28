# Jane had the following grades: 98,95,88,97,74 for an average of 90.4
# Samantha had the following grades: 85,93,98,88,49 for an average of 82.6
# Matt had the following grades: 87,93,89,97,65 for an average of 86.2

def average(grade_list)
  sum = 0
  grade_list.each do |grade|
    sum += grade
  end

  sum / grade_list.size.to_f
end

jane_grades = [98, 95, 88, 97, 74]
jane_average = average(jane_grades)
puts "Jane's Average: #{jane_average}"

def average(grade_list)
  sum = 0
  grade_list.each do |grade|
    sum += grade
  end

  sum / grade_list.size.to_f
end

samantha_grades = [85, 93, 98, 88, 49]
samantha_average = average(samantha_grades)
puts "Samantha's Average: #{samantha_average}"

def average(grade_list)
  sum = 0
  grade_list.each do |grade|
    sum += grade
  end

  sum / grade_list.size.to_f
end

matt_grades = [87, 93, 89, 97, 65]
matt_average = average(matt_grades)
puts "Matt's Average: #{matt_average}"

# Part 2
def letter_grade(average)
  if average >= 90
    'A'
  elsif average >= 80
    'B'
  elsif average >= 70
    'C'
  elsif average >= 60
    'D'
  else
    'F'
  end
end

jane_letter_grade = letter_grade(jane_average)
puts "Jane's Letter Grade: #{jane_letter_grade}"

samantha_letter_grade = letter_grade(samantha_average)
puts "Samantha's Letter Grade: #{samantha_letter_grade}"

matt_letter_grade = letter_grade(matt_average)
puts "Matt's Letter Grade: #{matt_letter_grade}" 

# Part 3
def rankings(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student}"
  end
end

rankings(['Johnny', 'Jane', 'Sally', 'Elizabeth', 'Michael'])
