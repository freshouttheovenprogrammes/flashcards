require_relative 'round'
require_relative 'card'
require 'pry'

class Guess

  attr_reader :card, :response

  def initialize(card, response)
    @card = card
    @response = response
  end

  def correct?
    card.answer == response
  end

  def feedback
    if correct?
      "Correct"
    else
      "Incorrect"
    end
  end

end
