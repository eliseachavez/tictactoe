require_relative 'main'

# Can X or O be inserted at a position?
describe 'Game' do
  context 'when X is inserted at a position' do
    it 'returns' do
    end
  end
  context 'when O is inserted at a position' do
    it 'returns' do
    end
  end
end

# Does it accurately check if a player has won?
describe '#decide_winner' do
end

# Is there a string representation of the board?
describe 'Board' do
  def print_board
    @board.each_index do |index|
      print '[ '
      if @board[index] == 'x' || @board[index] == 'o'
        print @board[index]
      else
        print ' '
      end
      print ' ]'

      puts if @board_map.include?(2, 5, 8) # index == 2 || index == 5 || index == 8
    end
  end
end

# Is a field on the board occupied or free?
describe 'Board' do
end
