class Dealer < User
  def initialize(name = 'Dealer')  
    super 
    @balance = 100
  end
end