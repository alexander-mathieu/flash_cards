require 'pry'

class CardGenerator
  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def read
    generated_deck = []
    file_name = File.open("./cards.txt", "r")
    file_name.each_line do |line|
      card = line.chomp.split(",")
    generated_deck << card
    end
  file_name.close
  generated_deck
  end
end
