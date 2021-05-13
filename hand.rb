# frozen_string_literal: true

require_relative 'deck'
require_relative 'card'
require_relative 'modules'
require_relative 'user'

class Hand
  attr_accessor :hand, :self_points

  def initialize(_name)
    @hand = []
    @self_points = 0
  end

  def get_card
    card = desk.all_cards.rand
    hand.append(card)
    desk.all_cards.delete(card)
    self.self_points += card.points
  end
end
