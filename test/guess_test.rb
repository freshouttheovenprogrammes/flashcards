require_relative 'test_helper'
require_relative '../lib/guess'
require_relative '../lib/card'

class GuessTest < Minitest::Test

  def test_that_guess_can_make_card_obj
    card = Card.new("What is the capital of Alaska?", "Juneau", "you know")
    guess = Guess.new(card, "Juneau")

    assert_equal card, guess.card
  end

  def test_that_guess_can_take_response
    card = Card.new("What is the capital of Alaska?", "Juneau", "you know")
    guess = Guess.new(card, "Juneau")

    assert_equal card.answer, guess.response
  end

  def test_that_guess_can_take_response_and_assert_correct
    card = Card.new("What is the capital of Alaska?", "Juneau",  "you know")
    guess = Guess.new(card, "Juneau")

    assert guess.correct?
  end

  def test_that_we_get_feedback
    card = Card.new("Whose a good dog?", "Merle", "sweet bubby")
    guess = Guess.new(card, "Merle")

    assert guess.correct?
    assert_equal "Correct", guess.feedback
  end

def test_we_get_constructive_critism
  card = Card.new("Whose a good dog?", "Merle", "sweet bubby")
  guess = Guess.new(card, "Doggo?")

  assert_equal "Incorrect", guess.feedback
end

end
