require_relative 'card_generator'
require_relative 'round'
require 'csv'

class Runner
filename = ARGV[0]

deck = Deck.new([])
round = Round.new(deck)


generator = CardGenerator.new(filename)
generator.load(filename, deck)
round.start
round.play
end
