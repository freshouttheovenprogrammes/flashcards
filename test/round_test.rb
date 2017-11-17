require_relative 'test_helper'
require_relative '../lib/round'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/guess'

class RoundTest < Minitest::Test


  def test_that_round_can_take_a_deck

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    my_deck = Deck.new([card_1, card_2])
    my_round = Round.new(my_deck)

    assert_equal my_deck, my_round.deck
  end

  def test_that_we_know_first_card_is_current

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1, round.current_card
  end

  def test_that_guesses_are_recorded

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)


    round.record_guess("Juneau")

    assert_equal "Juneau", round.guesses.first.response

    assert_equal 1, round.guesses.count
  end

  def test_that_guesses_get_appropriate_feedback

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("Juneau")


    assert_equal 1, round.guesses.count

    assert_equal "Correct!", round.guesses.first.feedback

    assert_equal 1, round.number_correct
  end

  def test_that_two_guesses_get_counted

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("Juneau")

    assert_equal 1, round.guesses.count
    assert_equal "Correct!", round.guesses.first.feedback


    round.record_guess("93,000,000")
    assert_equal 2, round.guesses.count
    assert_equal 2, round.number_correct
  end

end
