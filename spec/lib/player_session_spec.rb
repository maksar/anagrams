require_relative '../spec_helper'
require_relative '../../lib/player_session'

describe PlayerSession do
  let(:session) { PlayerSession.new '' }

  it 'stores all entered words' do
    session.add_word 'word'
    session.add_word 'word'
    session.words.length.must_equal 1
  end
end