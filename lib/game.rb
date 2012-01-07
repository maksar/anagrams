class Game
  attr_reader :players
  attr_reader :anagram

  def initialize(anagram)
    @players = {}
    @anagram = anagram
    @histogram = create_histogram anagram
  end

  def add_player player
    @players[player.name] = player
  end

  def write_word player, word
    player.add_word(word) if valid_word? word
  end

  private

  def valid_word? word
    create_histogram(word).
        each_with_object(create_histogram(anagram)) {|(k,v), h| h[k] = (h[k] || 0) - v}.
        values.
        all? { |v| v >= 0 }
  end

  def create_histogram word
    word.
        chars.
        group_by { |char| char }.
        each_with_object({}) { |(k, v), h| h[k] = v.count }
  end
end