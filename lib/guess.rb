require_relative 'round'
require_relative 'card'
require_relative 'control_module'
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
      "Correct!"
    else
      "Failure"
    end
  end

end
