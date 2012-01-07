require 'histogram'

class Game
  attr_reader :players
  attr_reader :anagram

  def initialize(anagram)
    @players = {}
    @anagram = anagram
  end

  def add_player player
    @players[player.name] = player
  end

  def write_word player, word
    player.add_word(word) if valid_word? word
  end

  private

  def valid_word? word
    Histogram.for(word).substract(anagram).values.all? { |v| v >= 0 }
  end
end