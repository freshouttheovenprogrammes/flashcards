require 'pry'

class CardGenerator

  attr_reader :filename

  def initialize(filename = "data/cards.txt")
    @filename = filename
  end

  def load(deck)
    file_check
    data = CSV.readlines(@filename, headers: true, header_converters: :symbol)
     data.each do |row|
       deck.cards << Card.new(row[:question], row[:answer].lstrip)
     end
  end

  def file_check
    until File.exist?(filename) == true
      puts "Please try another filename"
      @filename = $stdin.gets.chomp
    end
  end

end
