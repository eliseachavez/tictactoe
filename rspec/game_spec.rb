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
describe '#find_winning_sequences' do
let(:game_win) { Game.new }
  subject(:board) { described_class.new }
  #double = double(['x', 'x', 'x', ' ', ' ', ' ', ' ', ' ', ' '])
  # let(:board) { double('random_number') }
  xit 'returns a string representation of the board' do
    win_sequence = "[x][x][x]\n[ ][ ][ ]\n[ ][ ][ ]"
    allow(:find_winning_sequences).to receive("[x][x][x]\n[ ][ ][ ]\n[ ][ ][ ]").and_return('Player 1')
    game_outcome =  game.game_over? # but game_over is a private method...am I supposed to stub this too?
    expect(game_outcome).to be_game_over
    # game.play # can't do this because play will prompt user for a selection and I need to bypass this
    # #expect(board_string).to output(test_string).to_stdout
    # # or
    # game.game_over? # can't do this because game_over is a private method
  end
end

# Is there a string representation of the board?
describe 'Board' do
  subject(:board) { described_class.new(['x', 'x', 'x', ' ', ' ', ' ', ' ', ' ', ' ']) }
  it 'returns a string representation of the board' do
    #board.board_map.instance_variable_set(['x', 'x', 'x', ' ', ' ', ' ', ' ', ' ', ' '])
    allow(:print_board).to_receive(:puts).and_return("[x][x][x]\n[ ][ ][ ]\n[ ][ ][ ]")
    expect(board.print_board).to return("[x][x][x]\n[ ][ ][ ]\n[ ][ ][ ]").to_stdout
  end
end

describe 'Board' do
  xit 'returns' do
  end
end
