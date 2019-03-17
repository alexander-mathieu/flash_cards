require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/round'

class RoundTest < MiniTest::Test
  attr_reader :card_1,
              :card_2,
              :card_3,
              :deck,
              :round

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @deck  = Deck.new([card_1, card_2, card_3])
    @round = Round.new(deck)
  end

  def test_deck_and_round_objects_exist
    assert_instance_of Deck, deck
    assert_instance_of Round, round
  end

  def test_turns_array_starts_empty
    assert round.turns.empty?
  end

  def test_current_card_method_shows_card_1_at_start
    assert_equal card_1, round.current_card
  end

  def test_take_turn_method_moves_cards_to_turns_array
    new_turn = round.take_turn("Juneau")

    assert_equal 1, round.turns.length
  end

  def test_new_turn_is_instance_of_turn
    new_turn = round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
  end

  def test_new_turn_returns_true_when_true
    new_turn = round.take_turn("Juneau")

    assert new_turn.correct?, true
  end

  def test_category_method_returns_an_array_of_unique_categories
    assert_equal 2, round.category.count
  end

  def test_round_shows_number_of_correct_guesses
    new_turn = round.take_turn("Juneau")

    assert_equal 1, round.number_correct
  end

  def test_additional_new_turns_add_to_turns_array
    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")

    assert_equal 2, round.turns.count
  end

  def test_turns_return_feedback
    new_turn = round.take_turn("Juneau")

    assert_equal "Correct!", round.turns.last.feedback

    new_turn = round.take_turn("Venus")

    assert_equal "Incorrect.", round.turns.last.feedback
  end

  def test_round_shows_percent_correct
    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")

   assert_equal 50.0, round.percent_correct
  end

  def test_round_shows_number_correct_by_category
    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")
    new_turn = round.take_turn("North north west")

     assert_equal 1, round.number_correct_by_category(:STEM)
     assert_equal 1, round.number_correct_by_category(:Geography)
  end

  def test_round_shows_percentage_correct_by_category
    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")
    new_turn = round.take_turn("North north west")

    assert_equal 50.0, round.percent_correct_by_category(:STEM)
    assert_equal 100.0, round.percent_correct_by_category(:Geography)
  end
end
