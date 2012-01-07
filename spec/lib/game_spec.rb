require 'spec_helper'

require 'game'

describe Game do
  it 'creates new game' do
    Game.create_new_game.should be_instance_of Game
  end

end