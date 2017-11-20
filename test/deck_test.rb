require_relative 'test_helper'
require_relative '../lib/deck'
require_relative '../lib/card'
require_relative '../lib/guess'

class DeckTest < Minitest::Test

  def test_that_we_have_empty_deck
    d = Deck.new

    assert_equal [], d.cards
  end

  def test_that_we_have_cards_in_the_deck
    deck = Deck.new

    assert_equal [], deck.cards

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", "you know?")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", "The next one from us")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", "like kanye and kims baby")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal ([card_1, card_2, card_3]), deck.cards
    assert_equal 3, deck.count
  end

end
