require './lib/card'

class CardGenerator
  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def read_file
    card_content = []
    new_file = File.open(file_name)
    new_file.each_line do |line|
      card_content << line.chomp.split(",")
    end
  new_file.close
  card_content
  end

  def create_cards
    cards = []
    read_file.each do |entry|
      question = entry[0]
      answer   = entry[1].to_s
      category = entry[2]
      cards << Card.new(question, answer, category)
    end
    cards
  end
end
