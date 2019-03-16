require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < MiniTest::Test
  attr_reader :card_1,
              :card_2,
              :card_3,
              :cards,
              :deck

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [card_1, card_2, card_3]
    @deck = Deck.new(cards)
  end

  def test_deck_object_exists
    assert_instance_of Deck, deck
  end

  def test_deck_object_has_an_array_of_cards
    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_deck_object_can_return_length_of_card_array
    assert_equal 3, deck.cards.count
  end

  def test_deck_object_knows_card_categories
    assert_equal 0, deck.cards_in_category("Pop Culture").length
    assert_equal 1, deck.cards_in_category(:Geography).length
    assert_equal 2, deck.cards_in_category(:STEM).length
  end
end
