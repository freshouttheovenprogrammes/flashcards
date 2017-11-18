class CardGenerator

  attr_reader :filename

  def initialize(filename)
    filename = "data/cards.txt"
  end

  def reader
    filename = File.open(ARGV[0], 'r').read.chomp
    filename.map do |row|
      row
    end
  end
  
end
