require_relative 'test_helper'
require_relative '../lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_default_filename
    c = CardGenerator.new(0)
    c.reader
    assert_equal "data/cards.txt", c.filename
  end



end
