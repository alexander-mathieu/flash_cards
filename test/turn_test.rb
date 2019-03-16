require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test
  attr_reader :card

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  def test_card_and_turn_objects_exist
    turn = Turn.new("Juneau", card)

    assert_instance_of Card, card
    assert_instance_of Turn, turn
  end

  def test_turn_guess_method_returns_guess
    turn = Turn.new("Juneau", card)

    assert_equal turn.guess, "Juneau"
  end

  def test_correct_method_returns_true_when_true
    turn = Turn.new("Juneau", card)

    assert_equal turn.correct?, true
  end

  def test_correct_method_returns_false_when_false
    turn = Turn.new("Anchorage", card)

    assert_equal turn.correct?, false
  end

  def test_feedback_method_returns_positive_feedback_when_correct
    turn = Turn.new("Juneau", card)

    assert_equal turn.feedback, "Correct!"
  end

  def test_feedback_method_returns_negative_feedback_when_incorrect
    turn = Turn.new("Anchorage", card)

    assert_equal turn.feedback, "Incorrect."
  end
end
