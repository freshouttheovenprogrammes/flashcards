require_relative 'deck'
require_relative 'guess'

class Round

  include Control

  attr_reader :deck, :guesses
  attr_accessor :current, :correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current = 0
    @correct = 0
  end

  def record_guess(response)
    guess = Guess.new(current_card, response)
    @guesses.push(guess)
  end

  def current_card
    deck.cards[current]
  end

  def number_correct_counter
    if self.current_card.answer == self.guesses[current].response
    end
    add_correct
  end

  def number_correct
    self.number_correct_counter
    return @correct
  end

end

=begin
card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
deck = Deck.new([card_1, card_2])
round = Round.new(deck)
round.deck
=> #<Deck:0x007ffdf181b9c8 @cards=[...]>
round.current_card
=> #<Card:0x007ffdf1820a90 @answer="Juneau", @question="What is the capital of Alaska?">
round.record_guess("Juneau")
=> #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="Juneau", @question="What is the capital of Alaska?">, @response="Juneau">
round.guesses.first.feedback
=> "Correct!"
round.number_correct
=> 1
round.current_card
=> #<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">
round.record_guess("2")
=> #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">, @response="2">
round.guesses.count
=> 2
round.guesses.last.feedback
=> "Incorrect."
round.number_correct
=> 1
round.percent_correct
=> 50
=end
