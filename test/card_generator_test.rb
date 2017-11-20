require_relative 'test_helper'
require_relative '../lib/card_generator'
require_relative '../lib/deck'

class CardGeneratorTest < Minitest::Test

  def test_default_filename
    c = CardGenerator.new("")
    deck = Deck.new([])
    c.load(deck)
    assert_equal "data/cards.txt", c.filename
  end

  def test_that_we_have_correct_hint_for_correct_card
    skip
    c = CardGenerator.new(0)


  end


end
