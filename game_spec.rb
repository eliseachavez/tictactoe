# frozen_string_literal: true

#require_relative 'main'

# Can X or O be inserted at a position?
describe 'Game' do
  context 'when X is inserted at a position' do
    xit 'returns' do
    end
  end
  context 'when O is inserted at a position' do
    xit 'returns' do
    end
  end
end

# Does it accurately check if a player has won?
describe '#decide_winner' do
  xit 'returns' do
    expect('hi').to be_game_over
  end
end

# Is there a string representation of the board?
describe 'Board' do
  subject(:board) { described_class.new }
  #double = double(['x', 'x', 'x', ' ', ' ', ' ', ' ', ' ', ' '])
  # let(:board) { double('random_number') }
  it 'returns a string representation of the board' do
    # board.set_tile_symbol(0, 'x')
    # board.set_tile_symbol(1, 'x')
    # board.set_tile_symbol(2, 'x')
    win_tiles = ['x', 'x', 'x', ' ', ' ', ' ', ' ', ' ', ' ']
    test_string = "[x][x][x]\n[ ][ ][ ]\n[ ][ ][ ]"

    game_outcome = game_over
    expect(board_string).to output(test_string).to_stdout
  end
end

describe 'Board' do
  xit 'returns' do
  end
end
