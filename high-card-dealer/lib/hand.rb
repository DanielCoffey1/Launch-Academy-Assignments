# your code here
class Hand
  initialize(deck)
  @player_one_hand = [] << deck.deal
  @player_two_hand = [] << deck.deal
end
