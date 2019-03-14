require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class Round
  attr_reader :deck
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_count = 0
    @turns_taken = 0
  end

  def turns
    @turns
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    if new_turn.correct? == true
      @correct_count +=1
    end
    @turns_taken += 1
    new_turn
  end

  def number_correct
    @correct_count
  end

  def percent_correct
    @correct_count.fdiv(@turns_taken) * 100
  end
end

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#
# deck = Deck.new([card_1, card_2, card_3])
#
# round = Round.new(deck)
#
# binding.pry
#
# round.take_turn('Juneau')
