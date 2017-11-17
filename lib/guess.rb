require_relative 'card'
require_relative 'round'
require_relative 'control_module'

class Guess

  include Control

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
      add_correct
      "Correct!"
    else
      "Failure"
    end
    add_current
  end

end
