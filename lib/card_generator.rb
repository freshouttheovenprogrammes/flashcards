require 'pry'

class CardGenerator

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
    until File.exist?(@filename) == true
      puts "Please try another filename"
      @filename = $stdin.gets.chomp
    end
  end

end
