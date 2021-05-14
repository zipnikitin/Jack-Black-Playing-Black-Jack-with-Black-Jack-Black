# frozen_string_literal: true

require_relative 'deck'
require_relative 'card'
require_relative 'hand'
require_relative 'user'
require_relative 'dealer'

module Game_brains
  attr_accessor :dealer, :player, :balance, :self_points, :cards, :winner

  def results
    if (21 - player.hand.self_points) < (21 - dealer.hand.self_points) || dealer.hand.self_points > 21
      @@winner = player.name
      player.balance += deck.bank
    elsif (21 - player.hand.self_points) > (21 - dealer.hand.self_points) || player.hand.self_points > 21
      dealer.balance += deck.bank
      @@winner = dealer.name
    else
      dealer.balance += 10
      dealer.balance += 10
    end
  end

  def restart
    self.deck.all_cards.pop(52)
    self.deck.generate_cards
    self.player.hand.self_points = 0
    self.dealer.hand.self_points = 0
  end
  
  def rebalance
    self.player.hand.self_cards.pop(3)
    self.dealer.hand.self_cards.pop(3)
    2.times do
      self.player.hand.get_card(self.deck.give_card)
      self.dealer.hand.get_card(self.deck.give_card)
    end
    player.balance -= 10
    dealer.balance -= 10
    deck.bank += 20
  end

  def create_game
    name = gets.chomp
    self.deck = Deck.new
    self.player = User.new(name)
    self.dealer = Dealer.new
  end

  def dealer_take_card
    self.dealer.hand.get_card(self.deck.give_card)
  end

  def player_take_card
    self.player.hand.get_card(self.deck.give_card)
  end
end
