require './lib/card'

class Deck
  attr_reader :cards,
              :category,

  def initialize(cards = [])
    @cards = cards
    @category = category
    @categoried_cards = []
  end

  def count
    @cards.length
  end

  def cards_in_category(card_category)
    @cards.each do |card|
      if card.category == card_category
        @categoried_cards << card
      end
    end
    @categoried_cards
  end
end


  # def cards_in_category(card_category)
  #   cards_in_category = 0
  #   @cards.each do |card|
  #     if card.category == card_category
  #       cards_in_category += 1
  #     end
  #   end
  #   cards_in_category
  # end
#end

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#
# cards = [card_1, card_2, card_3]
#
# deck = Deck.new(cards)
#
# require 'pry'; binding.pry
