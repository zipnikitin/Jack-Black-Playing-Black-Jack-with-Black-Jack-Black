# frozen_string_literal: true

require_relative 'deck'
require_relative 'card'
require_relative 'modules'
require_relative 'user'

class Hand
  attr_accessor :self_cards, :self_points

  def initialize
    @self_cards = []
    @self_points = 0
  end

  def get_card(card)
    self.self_cards.append(card)
    if  card.rank == 'Ace' && self.self_points > 10
      card.points = 1 
    end
    self.self_points += card.points
  end
end
