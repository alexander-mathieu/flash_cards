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

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    if new_turn.correct? == true
      @correct_count += 1
    end
    @turns_taken += 1
    new_turn
  end

  def number_correct
    @correct_count
  end

  def percent_correct
    @correct_count.fdiv(@turns_taken) * 100
  end

  def number_correct_by_category(card_category)
    @correct_by_category = []
    @correct_guesses     = []
    @turns.each do |card|
      if card.correct?
        @correct_guesses << card
      end
    end
    @correct_guesses.each do |card|
      if card.card.category == card_category
        @correct_by_category << card
      end
    end
    @correct_by_category.count
  end


  def percent_correct_by_category(card_category)
    @total_by_category = []
    @turns.each do |card|
      if card.card.category == card_category
        @total_by_category << card
      end
    end
    number_correct_by_category(card_category).fdiv(@total_by_category.count) * 100
  end
end
