class Card
  attr_reader :rank :suit :value
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = value
  end

  def face_card?
    ['J', 'Q', 'K', 'A'].include?(@rank)
  end

  def value
    @value = rank
    if 'J'
      value = 11
    elsif 'Q'
      value = 12
    elsif 'K'
      value = 13
    else 'A'
      value = 14
    end
  end

  # Your code here

  # Methods you may need:
  # - initialize
  # - method that assigns a card its "value"
  # - attribute readers
  # - any other methods you deem necessary
