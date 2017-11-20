require 'pry'
require 'csv'

class CardGenerator

  attr_reader :filename

  def initialize(filename)
    @filename = filename
    file_check
  end

  def load(deck)
    data = CSV.readlines(@filename, headers: true, header_converters: :symbol)
     data.each do |row|
       deck.cards << Card.new(row[:question], row[:answer].lstrip, row[:hints])
     end
  end

  def file_check
    if @filename == ""
      @filename = "data/cards.txt"
    end
    until File.exist?(@filename) == true
      puts "Please try another filename"
      @filename = $stdin.gets.chomp
    end
  end

end
