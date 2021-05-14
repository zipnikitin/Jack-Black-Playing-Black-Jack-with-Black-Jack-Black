# frozen_string_literal: true

require_relative 'deck'
require_relative 'hand'
require_relative 'modules'
require_relative 'user'

class Card
  TYPES = ['<3', '+', '<>', '^']
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  POINTS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]

  attr_accessor :type, :rank, :points

  def initialize(type, rank, points)
    @type = type
    @rank = rank
    @points = points
  end
end
