# frozen_string_literal: true

require_relative 'cards'
require_relative 'modules'
require_relative 'user'

class Interface
  include Statistics

  def initialize
    @bank = 0
  end

  def start_using
    create_game
    create_player
    create_dealer
    while player.balance != 0
      start_cards
      puts "Your balance:#{player.balance}"
      puts "Your cards:#{player.show_cards}"
      puts "Your cards points:#{player.sum_points}"
      puts "Bank balance:#{@bank}"
      puts "Dealer balance#{dealer.balance}"
      puts 'Dealer cards: ** **'
      puts '1) Continue
      2) Restart
      3) Exit'
      a = gets.chomp
      case a
      when '1'
        puts 'Lets get it started!
        Your balance: ' + player.balance -= 10
        puts "Dealers balance:#{dealer.balance -= 10}"
        puts "Bank balance:#{@bank += 20}"
        puts '1) Pass
        2) Add a card
        3) Show cards'
        a = gets.chomp
        case a
        when '1'
          dealer_turn
        when '2'
          player.get_card
          puts "Your balance:#{player.balance}"
          puts "Your cards:#{player.show_cards}"
          puts "Your cards points:#{player.sum_points}"
          dealer_turn
          winner
        when '3'
          winner
        end
      end
    end
  end

  private

  def start_cards
    2.times do
      player.get_card
      dealer.get_card
    end
  end

  def create_game
    self.game = Cards.new('Game')
  end

  def create_player
    print 'Main screen
    Welcome!
    Type your name: '
    name = gets.chomp
    self.player = User.new(name)
  end

  def create_dealer
    self.dealer = User.new('Dealer')
  end
end
