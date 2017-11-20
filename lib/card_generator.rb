# require_relative '../data/cards.txt'

class CardGenerator

  attr_reader :filename

  def initialize(filename = "data/cards.txt")
    @filename = filename
  end

  def load(filename, deck)
    data = CSV.read(filename, headers: true, header_converters: :symbol)
     data.map do |row|
       deck.cards << Card.new(:question, :answer)
     end
  end

end
