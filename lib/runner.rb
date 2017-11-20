require_relative 'card_generator'
require_relative 'round'
require 'csv'
require 'pry'

class Runner
filename = ARGV[0]

deck = Deck.new([])
round = Round.new(deck)

generator = CardGenerator.new(filename)
generator.load(deck)
round.start
round.play
end