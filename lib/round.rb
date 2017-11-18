require_relative 'deck'
require_relative 'guess'
require 'pry'

class Round

  attr_reader :deck, :guesses
  attr_accessor :current, :correct

  def initialize(deck)
    @deck      = deck
    @guesses   = []
    @current   = 0
    @correct   = 0
  end

  def record_guess(response)
    guess = Guess.new(current_card, response)
    @guesses.push(guess)
    if response == current_card.answer
      add_correct
    end
    add_current
  end


  def current_card
    deck.cards[current]
  end

  def number_correct
    return @correct
  end

  def percent_correct
    return (@correct.to_f / guesses.count.to_f) ** 100
  end

  def add_current
    @current += 1
  end

  def add_correct
    @correct += 1
  end

  def add_incorrect
    @incorrect += 1
  end


end

=begin
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
