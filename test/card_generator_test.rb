require_relative 'test_helper'
require_relative '../lib/card_generator'
require_relative '../lib/deck'
require_relative '../lib/card'

class CardGeneratorTest < Minitest::Test

  def test_default_filename
    c = CardGenerator.new("")
    deck = Deck.new([])
    c.load(deck)
    assert_equal "data/cards.txt", c.filename
  end

  def test_that_we_have_correct_hint_for_correct_card
    c = CardGenerator.new("")
    deck = Deck.new([])
    c.load(deck)

    assert_equal "you know?", deck.cards[0].hints.lstrip
  end



end
