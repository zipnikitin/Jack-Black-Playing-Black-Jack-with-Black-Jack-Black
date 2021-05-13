# frozen_string_literal: true

require_relative 'card'
require_relative 'hand'
require_relative 'modules'
require_relative 'user'

class Deck < Card
  attr_accessor :all_cards

  def initialize
    @all_cards = []
    generate_cards
  end

  def generate_cards
    Card::TYPES.each do |type|
      Card::NAME.each_with_index do |name, index|
        @all_cards.append(Card.new(type, name, Card::POINTS[index]))
      end
    end
  end
end
