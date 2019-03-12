require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_method_returns_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal turn.guess, "Juneau"
  end

  def test_method_returns_true
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal turn.correct?, true
  end

  def test_method_returns_false
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card)

    assert_equal turn.correct?, false
  end

  def test_method_returns_positive_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal turn.feedback, "Correct!"
  end

  def test_method_returns_negative_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card)

    assert_equal turn.feedback, "Incorrect."
  end
end
