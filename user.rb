# frozen_string_literal: true

require_relative 'cards'
require_relative 'modules'

class User
  attr_accessor :hand, :balance

  def initialize(_name)
    @balance = 100
    @hand = []
    sum_points
  end

  def self.get_card
    card = game.all_cards.rand
    hand.append(card)
    game.all_cards.delete(card)
  end

  def dealer_turn
    if dealer.points < 17 && @dealer.cards.length != 3
      puts 'Dealer take a card'
      dealer.get_card
    elsif dealer.points >= 17
      stats
    end
  end

  def self.sum_points
    hand.each do |card|
      points += card.points
    end
  end

  def self.show_cards
    hand.each { |name| puts card.name }
  end
end
