# Failure/Error:
#   RSpec.describe Cage do
#     let(:cage) { Cage.new }
#     let(:koko) { Gorilla.new("Koko") }
#
#     describe "#animal=" do
#       it "has a writer for animal" do
#         expect { cage.animal = koko }.to_not raise_error
#       end
#     end

class Cage
  # 1) Cage#animal= has a writer for animal
  #  Failure/Error: expect { cage.animal = koko }.to_not raise_error
  attr_accessor :animal

  def initialize
    @animal = nil
  end
  # 1) Cage#empty? returns true when no animals present
  #     Failure/Error: expect(cage.empty?).to be(true)
  #
  #     NoMethodError:
  #       undefined method `empty?' for #<Cage:0x007f843b139e50>
  #     # ./spec/4_cage_spec.rb:22:in `block (3 levels) in <top (required)>'
  def empty?
    @animal.nil?
  end
end
