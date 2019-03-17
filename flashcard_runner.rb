require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
# require './lib/card_generator'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

card_3 = Card.new("Who came up with the first theory of gravity?", "Sir Isaac Newton", :STEM)

card_4 = Card.new("What is the tallest mountain in Colorado?", "Mount Elbert", :Geography)

deck = Deck.new([card_1, card_2, card_3, card_4])

round = Round.new(deck)

round.start

# cards = CardGenerator.new("./cards.txt").create_cards
#
# deck = Deck.new(cards)
#
# round = Round.new(deck)
#
# round.start
