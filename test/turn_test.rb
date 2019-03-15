require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_turn_object_is_instance_of_class_turn
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_card_object_is_instance_of_class_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Card, card
  end

  def test_turn_object_returns_card_object
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_same turn.card, card
  end

  def test_turn_guess_method_returns_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal turn.guess, "Juneau"
  end

  def test_correct_method_returns_true_when_true
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal turn.correct?, true
  end

  def test_correct_method_returns_false_when_false
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card)

    assert_equal turn.correct?, false
  end

  def test_feedback_method_returns_positive_feedback_when_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal turn.feedback, "Correct!"
  end

  def test_feedback_method_returns_negative_feedback_when_incorrect
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card)

    assert_equal turn.feedback, "Incorrect."
  end
end
