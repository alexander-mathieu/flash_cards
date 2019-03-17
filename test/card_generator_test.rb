require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < MiniTest::Test
  attr_reader :cards,
              :file_name

  def setup
    @cards = CardGenerator.new(@file_name)
  end


  def test_card_generator_exists
    assert_instance_of CardGenerator, cards
  end

  def test_card_generator_can_read_a_file_and_create_a_deck
    assert_equal 4, cards.generate_deck.count
  end
end
