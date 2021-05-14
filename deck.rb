# frozen_string_literal: true

require_relative 'card'
require_relative 'hand'
require_relative 'modules'
require_relative 'user'

class Deck
  attr_accessor :all_cards, :bank

  def initialize
    @bank = 0
    @all_cards = []
    generate_cards
  end

  def generate_cards
    Card::TYPES.each do |type|
      Card::RANKS.each_with_index do |rank, index|
        @all_cards.append(Card.new(type, rank, Card::POINTS[index]))
      end
    end
  end

  def give_card
    card = self.all_cards.sample
    self.all_cards.delete(card)
  end
end
