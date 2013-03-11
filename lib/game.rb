require_relative 'histogram'
require_relative 'player_session'

require 'active_support/core_ext/hash/except'

class Game
  attr_reader :players
  attr_reader :anagram

  def initialize anagram
    @players = {}
    @anagram = anagram
  end

  def add_player player
    @players[player.name] = PlayerSession.new(player.name)
  end

  def write_word player, word
    player.add_word(word) if valid_word? word
  end

  def duplicates player
    player.words & words_from_opponents(player)
  end

  private

  def words_from_opponents(player)
    players.except(player.name).values.collect(&:words).flatten
  end

  def valid_word? word
    (@anagram - word).positive?
  end
end