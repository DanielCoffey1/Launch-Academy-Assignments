people =
{
  "Jon Smith" => {
    "age" => "25",
    "income" => "50000",
    "household size" => "1",
    "gender" => "Male",
    "education" => "College"
  },
  "Jane Davies" => {
    "age" => "30",
    "income" => "60000",
    "household size" => "3",
    "gender" => "female",
    "education" => "High School"
  },
  "Sam Farelly" => {
    "age" => "32",
    "income" => "80000",
    "household size" => "2",
    "gender" => "Unspecified",
    "education" => "College"
  },
  "Joan Favreau" => {
    "age" => "35",
    "income" => "65000",
    "household size" => "4",
    "gender" => "Female",
    "education" => "College"
  },
  "Sam McNulty" => {
    "age" => "38",
    "income" => "63000",
    "household size" => "3",
    "gender" => "Male",
    "education" => "College"
  },
  "Mark Minahan" => {
    "age" => "48",
    "income" => "78000",
    "household size" => "5",
    "gender" => "Male",
    "education" => "High School"
  },
  "Susan Umani" => {
    "age" => "45",
    "income" => "75000",
    "household size" => "2",
    "gender" => "Female",
    "education" => "College"
  },
  "Bill Perault" => {
    "age" => "24",
    "income" => "45000",
    "household size" => "1",
    "gender" => "Male",
    "education" => "Did Not Complete High School"
  },
  "Doug Stamper" => {
    "age" => "45",
    "income" => "75000",
    "household size" => "1",
    "gender" => "Male",
    "education" => "College"
  },
  "Francis Underwood" => {
    "age" => "52",
    "income" => "100000",
    "household size" => "2",
    "gender" => "Male",
    "education" => "College"
  }
}


# Average age
sum = 0
people.each do |person|
  person.map[0]["age"]
  sum += person
end
puts sum / people.size
# Average income
# Average household size
# Female Percentage
# Male Percentage
# Unspecified Gender Percentage
# Percent of those who obtained a college education level
# Percent of those who obtained a high school education level
# Percent of those that did not finish high school


# Sample Output:
#
# Average Age: 37.4
# Average Income: 69100.0
# Average Household Size: 2.4
# Female %: 30.0
# Male %: 60.0
# Unspecified Gender %: 10.0
# College %: 70.0
# High School %: 20.0
# Did Not Finish High School %: 10.0
