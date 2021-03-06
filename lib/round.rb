require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck          = deck
    @turns         = []
    @correct_count = 0
    @turns_taken   = 0
  end

  # iterates through deck and asks user for guesses; returns feedback; ends game and prints results when the card count == 0

  def start
    puts "----------------------------------------------------"
    if deck.cards.count == 1
      puts "Welcome to Flashcards! You're playing with #{deck.cards.count} card."
    else
    puts "Welcome to Flashcards! You're playing with #{deck.cards.count} cards."
    end
    puts "----------------------------------------------------"

    i = 0
    while i < deck.cards.count

    puts "This is card #{i + 1} of #{deck.cards.count}."
    puts "Question: #{deck.cards[i].question}"

    guess = gets.chomp
    take_turn(guess)

    puts "#{turns[i].feedback}"

    i += 1
    end

    puts "----------------------------------------------------"
    puts "           **       GAME OVER!       **             "
    puts "----------------------------------------------------"

    if number_correct == 1
      puts "You had #{number_correct} correct guess out of #{deck.cards.count} for a total score of #{percent_correct}%."
    else
      puts "You had #{number_correct} correct guesses out of #{deck.cards.count} for a total score of #{percent_correct}%."
    end
    categories.each do |category|
      puts "#{category}: #{percent_correct_by_category(category)}%"
    end
  end

  def current_card
    @deck.cards[@turns.count]
  end

  # creates a new turn; counts correct guesses; counts total guesses

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    if new_turn.correct? == true
      @correct_count += 1
    end
    @turns_taken += 1
    new_turn
  end

  # creates an array of card categories within the deck and removes duplicate categories

  def categories
    categories = []
    @deck.cards.map do |turn|
      categories << turn.category
    end
    categories.uniq!
  end

  def number_correct
    @correct_count
  end

  def percent_correct
    @correct_count.fdiv(@turns_taken) * 100
  end

  # creates an array of correct guesses and iterates through that array to find correct guesses by category

  def number_correct_by_category(card_category)
    correct_guesses     = []
    correct_by_category = []
    @turns.each do |card|
      if card.correct?
        correct_guesses << card
      end
    end
    correct_guesses.each do |card|
      if card.card.category == card_category
        correct_by_category << card
      end
    end
    correct_by_category.count
  end

  # creates an array of total guesses by category, and divides the number of guesses correct by category by the total guesses by category

  def percent_correct_by_category(card_category)
    total_by_category = []
    @turns.each do |card|
      if card.card.category == card_category
        total_by_category << card
      end
    end
    number_correct_by_category(card_category).fdiv(total_by_category.count) * 100
  end
end
