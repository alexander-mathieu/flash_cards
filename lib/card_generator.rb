require './lib/card'

class CardGenerator
  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  # reads a file line by line, and puts that information into an array

  def read_file
    card_content = []
    new_file = File.open(file_name)
    new_file.each_line do |line|
      card_content << line.chomp.split(",")
    end
  new_file.close
  card_content
  end

  # iterates through the card_content array and assigns the appropriate Card class arguments to each entry; creates a new instance of Card from each element in card_content array

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
