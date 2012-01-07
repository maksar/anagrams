require 'spec_helper'
require 'player_session'

describe PlayerSession do
  let(:session) { PlayerSession.new('') }
  it 'stores all entered words' do
    session.add_word 'word'
    session.add_word 'word'
    session.words.should have(1).item
  end
end