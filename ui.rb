# frozen_string_literal: true

require_relative 'deck'
require_relative 'card'
require_relative 'hand'
require_relative 'modules'
require_relative 'user'

class Interface
  include Resulting

  def start_using
    create_deck
    create_players
    while player.balance != 0
      start_cards
      statistics
      puts '1) Continue
      2) Restart
      3) Exit'
      a = gets.chomp
      case a
      when '1'
        statistics
        puts 'Lets get it started!
        1) Pass
        2) Add a card
        3) Show cards'
        a = gets.chomp
        case a
        when '1'
          dealer_turn
        when '2'
          player.get_card
          statistics
          dealer_turn
          ending
        when '3'
          ending
        end
      end
    end
  end

  private

  def start_cards
    2.times do
      player.get_card
      player.balance -= 10
      dealer.get_card
      dealer.balance -= 10
    end
  end

  def create_desk
    self.deck = deck.new('Deck')
  end

  def create_players
    print 'Main screen
    Welcome!
    Type your name: '
    name = gets.chomp
    self.player = User.new(name)
    self.dealer = User.new('Dealer')
  end

  def statistics
    puts "Your balance: #{player.balance}"
    puts "Your cards: #{player.show_cards}"
    puts "Your cards points: #{player.sum_points}"
    puts "Bank balance: #{deck.bank}"
    puts "Dealer balance: #{dealer.balance}"
  end

  def ending
    results
    puts "#{winner}wins!"
    statistics
    puts "Dealer cards: #{dealer.show_cards}"
  end
end
