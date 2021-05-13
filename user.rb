# frozen_string_literal: true

require_relative 'deck'
require_relative 'card'
require_relative 'hand'
require_relative 'modules'

class User
  attr_accessor :balance

  def initialize(_name)
    @balance = 100
  end

  def dealer_turn
    if dealer.points < 17 && @dealer.cards.length != 3
      puts 'Dealer take a card'
      dealer.get_card
    elsif dealer.points >= 17
      stats
    end
  end
end
