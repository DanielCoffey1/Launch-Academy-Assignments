class Employee
  # 1) Employee#name has a reader for name
  #  Failure/Error: expect(dixon.name).to eq("Dixon Bainbridge")
  # 1) Employee#title has a reader for title
  #   Failure/Error: expect(dixon.title).to eq("Owner")
  attr_reader :name, :title
  # 1) Employee.new takes a name and title as arguments
  #     Failure/Error: let(:dixon) { Employee.new("Dixon Bainbridge", "Owner") }
  #
  #     ArgumentError:
  #       wrong number of arguments (given 2, expected 0)
  def initialize(name, title = 'Zoo Keeper')
    # 1) Employee#title sets the default title to 'Zoo Keeper'
    # Failure/Error:
    #   def initialize(name, title)
    #     @name = name
    #     @title = title
    #   end
    @name = name
    @title = title
  end
  # 1) Employee#full_title returns the name and title of an employee
  #     Failure/Error: expect(dixon.full_title).to eq("Dixon Bainbridge, Owner")
  #
  #     NoMethodError:
  #       undefined method `full_title' for #<Employee:0x007f8c3f898500>
  #     # ./spec/5_employee_spec.rb:31:in `block (3 levels) in <top (required)>'
  def full_title
    "#{@name}, #{@title}"
  end

    # 1) Employee#greet should be a string
    #    Failure/Error: expect(dixon.greet).to be_a(String)
    #
    #    NoMethodError:
    #      undefined method `greet' for #<Employee:0x007fe09e92ac30>
  def greet
   #  1) Employee#greet should greet the user
   # Failure/Error: expect(dixon.greet).to eq("Dixon Bainbridge waved hello!")
   #
   #   expected: "Dixon Bainbridge waved hello!"
   #        got: ""
   #
   #   (compared using ==)
   # # ./spec/5_employee_spec.rb:41:in `block (3 levels) in <top (required)>'
    "#{@name} waved hello!"
  end
end
