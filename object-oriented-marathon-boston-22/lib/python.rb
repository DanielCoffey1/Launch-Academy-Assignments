class Python
  # 1) Python#name has a reader for name
  #   Failure/Error: expect(python.name).to eq("Long Mover")
  attr_reader :name
  # 1) Fox.new take a name as an argument
  #    Failure/Error: let(:fox) { Fox.new("Jack") }
  #
  #    ArgumentError:
  #      wrong number of arguments (given 1, expected 0)
  def initialize(name)
    @name = name
  end

  def speak
    # 1) Python#speak says what a snake says
    # Failure/Error: expect(python.speak).to eq("SSSSssssss...")
    "SSSSssssss..."
  end
end
