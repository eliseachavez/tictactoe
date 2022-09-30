# frozen_string_literal: true

require_relative '../lib/board'

describe '#print_board' do
  subject(:board) { Board.new(board_map) } # described_class doesn't work, not sure why, come back to later
  let(:board_map) { ['x', 'x', 'x', ' ', ' ', ' ', ' ', ' ', ' '] }
  it 'prints a string representation of the board' do
    expect { board.print_board} .to output("[ x ][ x ][ x ]\n[   ][   ][   ]\n[   ][   ][   ]\n").to_stdout
  end
end

describe Board do
  subject(:board) { described_class.new }
  # Can X or O be inserted at a position?
  context 'when x is inserted at a position' do
    it 'returns x at that position' do
      expect(board.set_tile_symbol(1, 'x')).to eq(board.get_tile_symbol(1, 'x'))
    end
  end
  context 'when o is inserted at a position' do
    it 'returns' do
      expect(board.set_tile_symbol(5, 'o')).to eq(board.get_tile_symbol(5, 'o'))
    end
  end
end

# describe 'Board' do
#   it 'prints a string representation of the board' do
#     board = instance_double("board", :board_map => ['x', 'x', 'x', ' ', ' ', ' ', ' ', ' ', ' '])
#     allow(board).to receive(:print_board)
#     expect { board.print_board } .to output("[x][x][x]\n[ ][ ][ ]\n[ ][ ][ ]").to_stdout
#   end
# end
# instance double used because that is what keeps test working even if you change method names (vs using a verified double)
# a double doesn't know what methods it has because it isn't an object. So you have to ALLOW the method for it to be used!
# you can either just use #allow(x).to receive(y) or #allow(x).to receive(y).and_return(z) depending on the method
