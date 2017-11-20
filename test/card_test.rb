require_relative 'test_helper'
require_relative '../lib/card'

class CardTest < Minitest::Test

  def test_that_card_exists
    c = Card.new("What is suzys name?", "Suzy", "It's Suzy!")
    assert_instance_of Card, c
  end

  def test_that_card_has_q_n_a
    
    c = Card.new("What is the capital of Alaska?", "Juneau", "you know?")

    assert_equal "What is the capital of Alaska?", c.question
    assert_equal "Juneau", c.answer
  end

end
