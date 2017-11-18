require_relative 'deck'
require_relative 'guess'
require 'pry'

class Round

  attr_reader :deck, :guesses
  attr_accessor :current, :correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current = 0
    @correct = 0
  end

  def record_guess(response)
    # takes argument of a response
    guess = Guess.new(current_card, response)
    # we instantiate guess which is the current_card and the response
    @guesses.push(guess)
    # now we are adding that to the guesses array
    # so after we've moved past the first card, it should add_current
    # current card changes after one has been pushed into the array
    if guesses.count >= 1
      # did this so that it wouldn't immediately add the card. before I was
      # getting the first card object twice in the guesses array.
      # a lot depends on the @current attribute. it defines current_card
      # which then I can define the correct answer to.
      add_current
    end
  end

  def current_card
    # pulls into the deck and uses the @current to define which indicies to use
    deck.cards[current]
  end

  def number_correct_counter
    # this method is broken!!!! need to figure this out most importantly.
    if current_card.answer == guesses[current].response
    add_correct
    end
  end

  def number_correct
    # just returns the amt. I would have made it differently but the schools
    # spec is pretty specific on the requirements for this method.
    self.number_correct_counter
    return @correct
  end

  def add_current
    # this is the adder method for current.
    @current += 1
  end

  def add_correct
    # this is the adder method for correct.
    @correct += 1
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
