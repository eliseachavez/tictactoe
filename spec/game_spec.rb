# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'

describe Game do
  subject(:game) { described_class.new }

  describe '#initialize' do
    # no need to test anything here as it only creates instance variables
  end

  describe '#start' do
    # public looping script, test condition -- except that will be covered inside the play method tests (test if over)
    context 'when game is over' do
      it 'stops calling the play method' do
        game.instance_variable_set(:@over, true)
        expect(game).not_to receive(:play)
        game.start
      end
    end
    context 'when game isn\'t over' do
      it 'calls the play method once' do
        #game.instance_variable_set(:@over, false) don't need to set to false bc it is automatically set to false
        # game.over = false
        expect(game).to receive(:play).once # not 1 time bc it will call it once whenn first called from main, before it checks condition
        game.start
        #game.over
      end
    end
  end

  describe '#play' do
    context 'when the game is over' do
      xit '' do
      end
    end
    
    context 'when the game isn\'t over' do
      xit ''
    end
  end
end

