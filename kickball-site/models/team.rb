require_relative "player"

class Team
  attr_reader :name
  attr_reader :players

  def initialize(name, position_data)
    # your code here
    @name = name
    @players = position_data
  end
end
