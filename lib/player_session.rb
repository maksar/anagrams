class PlayerSession
  attr_reader :words
  attr_reader :name

  def initialize name
    @name = name
    @words = []
  end

  def add_word word
    @words << word unless already_have? word
  end

  private

  def already_have? word
    @words.include? word
  end
end