# frozen_string_literal: true

require_relative 'deck'
require_relative 'card'
require_relative 'hand'
require_relative 'user'

module Resulting
  attr_accessor :dealer, :player, :balance, :points, :cards

  def results
    if (21 - player.points) < (21 - dealer.points) || dealer.points > 21
      winner = player.name
      player.balance == player.balance + game.bank
    elsif (21 - player.points) > (21 - dealer.points) || player.points > 21
      dealer.balance == player.balance + game.bank
    else
      dealer.balance += 10
      dealer.balance += 10
    end
  end
end
