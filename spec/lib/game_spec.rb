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
      let(:player) { stub(:name => 'Alice') }
      before { game.add_player(player) }

      it 'accepts correct anagram' do
        player.should_receive(:add_word)
        game.write_word(player, 'sam')
      end

      it 'declines incorrect anagram' do
        player.should_not_receive(:add_word)
        game.write_word(player, 'wrong')
      end
    end
  end
end