class Fox

  # 1) Fox#name has a reader for name
  #    Failure/Error: expect(fox.name).to eq("Jack")
  attr_reader :name
  # 1) Fox.new take a name as an argument
  #  Failure/Error: let(:fox) { Fox.new("Jack") }
  #
  #  ArgumentError:
  #    wrong number of arguments (given 1, expected 0)
  def initialize(name)
    @name = name
  end

  def speak
    # 1) Fox#speak says what foxes say
    # Failure/Error: expect(fox.speak).to eq("Ring-ding-ding-ding-dingeringeding!")
    "Ring-ding-ding-ding-dingeringeding!"
  end
end
