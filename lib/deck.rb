require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
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
