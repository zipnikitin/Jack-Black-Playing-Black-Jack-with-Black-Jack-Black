# frozen_string_literal: true

require_relative 'deck'
require_relative 'hand'
require_relative 'modules'
require_relative 'user'

class Card
  TYPES = ['<3', '+', '<>', '^'].freeze
  NAMES = %w[Ace 2 3 4 5 6 7 8 9 10 Jack Queen King].freeze
  POINTS = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10].freeze

  attr_accessor :type, :name, :points

  def initialize(type, name, points)
    @type = type
    @name = name
    @points = points
  end
end
