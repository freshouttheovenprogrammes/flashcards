require 'pry'

class CardGenerator

  attr_reader :filename

  def initialize(filename = "data/cards.txt")
    @filename = filename
  end

  def load(filename, deck)
    data = CSV.readlines(filename, headers: true, header_converters: :symbol)
     data.each do |row|
       deck.cards << Card.new(row[:question], row[:answer].lstrip)
     end
  end

end
