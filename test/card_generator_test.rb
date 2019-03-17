require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < MiniTest::Test
  attr_reader :card_generator,
              :file_name

  def setup
    @card_generator = CardGenerator.new(@file_name)
  end


  def test_card_generator_exists
    assert_instance_of CardGenerator, card_generator
  end

  def test_card_generator_can_read_a_file_and_create_an_array
    assert_equal 4, card_generator.read.count
  end
end
