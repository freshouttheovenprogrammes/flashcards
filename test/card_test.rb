require_relative 'test_helper'
require_relative '../lib/card'

class CardTest < Minitest::Test

  def setup
    c = Card.new
  end
  # this wasn't working like I thought it would

  def test_that_card_exists
    c = Card.new
    assert_instance_of Card, c
  end

  def test_that_card_has_q_n_a
    c = Card.new("What is the capital of Alaska?", "Juneau")

    assert_equal "What is the capital of Alaska?", c.question
    assert_equal "Juneau", c.answer
  end

end
