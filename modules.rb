require_relative 'cards'
require_relative 'user'

module Statistics
  attr_accessor :dealer, :player, :balance, :points, :cards
  def winner
    if (21 - player.points) < (21 - dealer.points) || dealer.points > 21
      puts player.name + 'wins!'
      puts 'Your balance: ' + player.balance==player.balance+game.bank
    elsif (21 - player.points) > (21 - dealer.points) || player.points > 21
      puts 'Dealer wins!'
      puts 'Dealer balance: ' + dealer.balance==player.balance+game.bank
      puts 'Your balance: ' + player.balance
    else
      'Pair!'
      puts 'Your balance: ' + dealer.balance+=10
      puts 'Dealer balance: ' + dealer.balance+=10
    end
  end
end