# frozen_string_literal: true

class Board
  # contains data for game board and methods to change its state
  WIN_SEQUENCES = %w[
    012 210
    345 543
    678 876
    048 840
    147 741
    036 630
    258 852
    642 246
  ].freeze

  def initialize(map = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '] )
    @board_map = map
  end

  def print_board
    @board_map.each_index do |index|
      print '[ '
      if @board_map[index] == 'x' || @board_map[index] == 'o'
        print @board_map[index]
      else
        print ' '
      end
      print ' ]'

      end_of_row_numbers = [2, 5, 8]
      puts if end_of_row_numbers.include?(index) # index == 2 || index == 5 || index == 8
    end
  end

  def set_tile_symbol(selection, player_symbol)
    @board_map[selection] = player_symbol
  end

  def get_tile_symbol(selection, player_symbol)
    @board_map[selection] = player_symbol
  end

  def create_player_sequence(mark)
    tiles = String.new('')
    @board_map.each_index do |index|
      tiles += index.to_s if @board_map[index] == mark
    end
    tiles
  end

  def count_number_of_blank_spaces
    nil_count = 0
    @board_map.each_index do |index|
      nil_count += 1 if @board_map[index] == ' '
    end
    nil_count
  end

  def chosen_tile_taken?(selection)
    if @board_map[selection] == 'x' || @board_map[selection] == 'o'
      true
    else
      false
    end
  end
end