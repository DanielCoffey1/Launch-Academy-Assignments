# Failure/Error:
#   RSpec.describe Gorilla do
#     let(:gorilla) { Gorilla.new("Bollo") }
#
#     describe ".new" do
#       it "take a name as an argument" do
#         expect(gorilla).to be_a(Gorilla)
#       end
#     end
#
#     describe "#name" do

class Gorilla
  #
  # 1) Gorilla#name has a reader for name
  #    Failure/Error: expect(gorilla.name).to eq("Bollo")
  attr_reader :name
  # 1) Gorilla.new take a name as an argument
  #  Failure/Error: let(:gorilla) { Gorilla.new("Bollo") }
  #
  #  ArgumentError:
  #    wrong number of arguments (given 1, expected 0)
  #  # ./spec/1_gorilla_spec.rb:4:in `initialize'
  #  # ./spec/1_gorilla_spec.rb:4:in `new'
  #  # ./spec/1_gorilla_spec.rb:4:in `block (2 levels) in <top (required)>'
  #  # ./spec/1_gorilla_spec.rb:8:in `block (3 levels) in <top (required)>'
  def initialize(name)
    @name = name
  end

  def speak
   #  1) Gorilla#speak says Bollo's catch phrase
   # Failure/Error: expect(gorilla.speak).to eq("#{gorilla.name} got a bad feeling about this...")
    "#{@name} got a bad feeling about this..."
  end
end
