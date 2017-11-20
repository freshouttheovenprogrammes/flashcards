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

  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈"
  end

  def play
    deck.cards.count.times do
        puts current_card.question
        input = $stdin.gets.chomp.downcase
          if input == "hint"
            puts current_card.hints.lstrip
            $stdin.gets.chomp.downcase
            puts guesses[current].feedback
          else record_guess(input)
          puts guesses[current-1].feedback
          end
    end
    puts "∆∆∆∆∆ Game over! ∆∆∆∆∆"
    puts "You got #{correct} correct out of #{deck.count}" +
         " for a total score of #{percent_correct}%"
  end

  def current_card
    deck.cards[current]
  end

  def number_correct
    return @correct
  end

  def percent_correct
    return (@correct.to_f / guesses.count.to_f * 100.0).round(2)
  end

  def add_current
    @current += 1
  end

  def add_correct
    @correct += 1
  end

end
