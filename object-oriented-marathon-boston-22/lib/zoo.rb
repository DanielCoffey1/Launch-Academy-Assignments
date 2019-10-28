# Failure/Error:
#   RSpec.describe Zoo do
#     season_opening_date = Date.parse("2015/04/1")
#     season_closing_date = Date.parse("2015/12/15")
#     let(:zoo) { Zoo.new("Zooniverse", season_opening_date, season_closing_date) }

class Zoo
  attr_reader :cages, :employees
  # 1) Zoo.new should take the name of the zoo, season opening date, and season closing date as a required argument
  #   Failure/Error: let(:zoo) { Zoo.new("Zooniverse", season_opening_date, season_closing_date) }
  #
  #   ArgumentError:
  #     wrong number of arguments (given 3, expected 0)
  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date

   #  1) Zoo.new should create ten cages by default
   # Failure/Error: expect(zoo.cages.count).to eq(10)
   #
   # NoMethodError:
   #   undefined method `cages' for #<Zoo:0x007fc60d152720>
   # had to attr_reader :cages
   @cages = []
   # 1) Zoo#add_employee should add a new employee to the employees array
   #   Failure/Error: zoo.add_employee(bob)
   # attr_reader for employees **
   @employees = []
   10.times do
     create_cages
   end
  end

  def create_cages
    @cages << Cage.new
  end
  # 1) Zoo#add_employee should add a new employee to the employees array
  #      Failure/Error: zoo.add_employee(bob)
  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    # 1) Zoo#open? should be open if it's within season open and close dates
    #  Failure/Error: expect(zoo.open?(date)).to be true
    #
    #  NoMethodError:
    #    undefined method `open?' for #<Zoo:0x007fa924148640>
    #    Did you mean?  open
    @season_opening_date <= date && date <= @season_closing_date
  end
  # 1) Zoo#add_animal should add an animal to the first open cage
  #    Failure/Error: zoo.add_animal(gorilla)
  #
  #    NoMethodError:
  #      undefined method `add_animal' for #<Zoo:0x007fd6549280d8>
  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        break
      end
    end
  end
  # 1) Zoo#visit should output a string
  #    Failure/Error: expect(zoo.visit).to be_a(String)
  #
  #    NoMethodError:
  #      undefined method `visit' for #<Zoo:0x007f803b057a68>

   #  1) Zoo#visit should tell us the employees that waved to us
   # Failure/Error: expect(zoo.visit).to include("Howard Moon waved hello!\n")
   def visit
   output = ""
   @employees.each do |employee|
     output += employee.greet + "\n"
   end
   @cages.each do |cage|
     if !cage.empty?
       output += cage.animal.speak + "\n"
     end
   end
   output
 end

end
