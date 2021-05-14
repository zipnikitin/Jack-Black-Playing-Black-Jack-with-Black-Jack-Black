# frozen_string_literal: true

require_relative 'deck'
require_relative 'card'
require_relative 'hand'
require_relative 'modules'

class User
  attr_reader :name, :hand
  attr_accessor :balance

  def initialize(name)
    @name = name
    @balance = 100
    @hand = Hand.new
  end
end
