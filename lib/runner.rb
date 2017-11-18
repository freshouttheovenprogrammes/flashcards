require_relative 'round'
require 'csv'

class Runner

card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
card_3 = Card.new("What is 5 + 5?", "10")
card_4 = Card.new("What is 5 + 6?", "11")
card_5 = Card.new("What is 5 + 7?", "12")
card_6 = Card.new("What is 5 + 8?", "13")
deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])
round = Round.new(deck)

round.start
round.play
end



=begin
Inside of this file, write the code to do the following:

Create some Cards
Put those card into a Deck
Create a new Round using the Deck you created
Start the round using a new method called start (round.start)
=end
