require 'spec_helper'
require 'game'

describe Game do
  context 'with created game' do
    let(:word) { 'sample' }
    let(:game) { Game.new(word) }

    it 'adds only new players' do
      game.add_player(stub(:name => 'Bob'))
      game.add_player(stub(:name => 'Bob'))

      game.players.should have(1).item
    end

    context 'with one player' do
      let(:player) { game.add_player(stub(:name => 'Alice')) }

      it 'accepts correct anagram' do
        game.write_word(player, 'sam')
        player.words.should include 'sam'
      end

      it 'declines incorrect anagram' do
        game.write_word(player, 'wrong')
        player.words.should be_empty
      end
    end

    context 'with two players' do
      let(:alice) { game.add_player(stub(:name => 'Alice')) }
      let(:bob) { game.add_player(stub(:name => 'Bob')) }

      before {
        game.write_word(alice, 'sam')
        game.write_word(alice, 'mas')
        game.write_word(bob, 'mas')
        game.write_word(bob, 'maple')
      }

      it 'shows which words were used by other players' do
        game.duplicates(bob).should eq %w(mas)
      end
    end
  end
end