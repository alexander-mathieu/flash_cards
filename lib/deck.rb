require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
    @cards_by_category = []
  end

  def count
    @cards.length
  end

  def cards_in_category(card_category)
    @cards.each do |card|
      if card.category == card_category
        @cards_by_category << card
      end
    end
    @cards_by_category
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
