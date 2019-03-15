require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(card_category)
    @cards_by_category = []
    @cards.each do |card|
      if card.category == card_category
        @cards_by_category << card
      end
    end
    @cards_by_category
  end
end
