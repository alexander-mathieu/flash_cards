require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < MiniTest::Test

  def tests_card_generator_exists
    card_generator = CardGenerator.new
  end
