class Card

  attr_reader :question, :answer, :hints

  def initialize(question, answer, hints)
    @question = question
    @answer = answer
    @hints = hints
  end

end
