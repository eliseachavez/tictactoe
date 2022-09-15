# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'
#require '/home/lemur/ruby/tictactoe/lib/game.rb'


# Does it accurately check if a player has won?
describe '#find_winning_sequences' do
  let(:board) { Game::Board.new }
  let(:game_win) { Game.new(board) }
  #double = double(['x', 'x', 'x', ' ', ' ', ' ', ' ', ' ', ' '])
  # let(:board) { double('random_number') }
  xit 'returns a string representation of the board' do
    # win_sequence = "[x][x][x]\n[ ][ ][ ]\n[ ][ ][ ]"
    # allow(:find_winning_sequences).to receive("[x][x][x]\n[ ][ ][ ]\n[ ][ ][ ]").and_return('Player 1')
    # game_outcome =  game.game_over? # but game_over is a private method...am I supposed to stub this too?
    # expect(game_outcome).to be_game_over
    
  end
end
