require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

deck = Deck.new([card_1, card_2, card_3])

round = Round.new(deck)

def start
  round.take_turn

  puts "Welcome to Flash Cards! You're playing with #{deck.cards.count} cards."
  puts "----------------------------------------------------"
  puts "This is card #{round.current_card} of #{deck.cards.count}"
  puts "Question: #{deck.cards.question}"

  user_input = gets

  puts "#{turn.feedback}"
