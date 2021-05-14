# frozen_string_literal: true

require_relative 'deck'
require_relative 'card'
require_relative 'hand'
require_relative 'modules'
require_relative 'user'
require_relative 'dealer'

class Interface
  attr_accessor :bank, :self_points, :self_cards, :deck, :dealer, :player, :winner

  include Game_brains

  def start_using
    @@winner = "Hi!"
        print '    Main screen
    Welcome!
    Type your name: '
    create_game
    while player.balance != 0
      rebalance
      statistics
      puts '    1) Continue
      2) Restart
      3) Exit'
      loop_game
    end
    puts 'You are out of money!'
  end

  private

  def loop_game
    a = gets.chomp
      case a
      when '1'
        statistics
        puts '    Lets get it started!
        1) Pass
        2) Add a card
        3) Show cards'
        b = gets.chomp
        case b
        when '1'
          dealer_turn
          ending
        when '2'
          player_take_card
          statistics
          dealer_turn
          ending
        when '3'
          ending
        end
      when '2'
        restart
      when '3'
        exit
      end
  end

  def dealer_turn
    puts "    Dealer's turn " 
    if dealer.hand.self_points < 17 && @dealer.hand.self_cards.length != 3
      puts '    Dealer take a card'
      dealer_take_card
    end
  end

  def statistics
    puts "    Your balance: #{player.balance}"
    puts "    Your cards: " 
    player.hand.self_cards.each { |card| print "    " + card.rank.to_s + " " + card.type.to_s}
    puts "
    Your cards points: #{player.hand.self_points}"
    puts "    Bank balance: #{deck.bank}"
    puts "    Dealer balance: #{dealer.balance}"
  end

  def ending
    results
    if @@winner.nil?
      puts "    Pair"
    elsif 
      puts "    " + @@winner + " wins!"
    end
    statistics
    puts "    Dealer cards: " 
    dealer.hand.self_cards.each { |card| print "    " + card.rank.to_s + " " + card.type.to_s }
    puts "
    Dealer cards points: #{dealer.hand.self_points}"
    puts "    1) Restart
        2) Exit"
    c = gets.chomp
      case c
      when '1'
        restart
      when '2'
        exit
      end
  end
end

game = Interface.new
game.start_using
