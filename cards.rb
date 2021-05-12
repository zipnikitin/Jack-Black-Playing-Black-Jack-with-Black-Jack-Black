require_relative 'user'
require_relative 'modules'

class Cards
  attr_accessor :all_cards
  def initialize
    @all_cards = [1..52]
    card_naming
  end

  def card_naming
    @all_cards.each do |card|
      if card.number ==  [1..13]
        card.type='+'
        card_numering(0)
      elsif card.number ==  [14..26]
        card.type='<3'
        card_numering(13)
      elsif card.number ==  [27..39]
        card.type='<>'
        card_numering(26)
      elsif card.number ==  [40..52]
        card.type='^'
        card_numering(39)
      end
    end
  end

	def card_numering(stage)
	  if card.number = 1+stage
	    card.name = 'Ace'
	    card.points = 11
	  elsif card.number = 11+stage
	    card.name = 'Jake'
	    card.points = 10
	  elsif card.number = 12+stage
	    card.name = 'Queen'
	    card.points = 10
	  elsif card.number = 13+stage
	    card.name = 'King'
	    card.points = 10
	  else 
	    card.name = card.number-stage
	    card.points = card.number-stage
	  end
	end
end