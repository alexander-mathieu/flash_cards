class CardGenerator
  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def generate_deck
    deck = []
    new_file = File.open(file_name)
    new_file.each_line do |line|
      card = line.chomp.split(",")
    deck << card
    end
  new_file.close
  deck
  end
end
