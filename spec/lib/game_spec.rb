require_relative '../spec_helper'
require_relative '../../lib/game'

describe Game do
  context 'with created game' do
    let(:game) { Game.new 'sample' }

    it 'adds only new players' do
      game.add_player(double 'player1', name: 'Bob')
      game.add_player(double 'player2', name: 'Bob')

      game.players.length.must_equal 1
    end

    context 'with one player' do
      let(:alice) { game.add_player double 'Alice', name: 'Alice' }

      it 'accepts correct anagram' do
        game.write_word alice, 'sam'
        alice.words.must_include 'sam'
      end

      it 'declines incorrect anagram' do
        game.write_word alice, 'wrong'
        alice.words.must_equal []
      end
    end

    context 'with two players' do
      let(:alice) { game.add_player double 'Alice', name: 'Alice' }
      let(:bob) { game.add_player double 'Bob', name: 'Bob' }

      before {
        game.write_word alice, 'sam'
        game.write_word alice, 'mas'
        game.write_word bob, 'mas'
        game.write_word bob, 'maple'
      }

      it 'shows which words were used by other players' do
        game.duplicates(bob).must_equal %w(mas)
      end
    end
  end
end