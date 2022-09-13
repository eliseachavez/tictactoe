# frozen_string_literal: true

# REQUIREMENTS
# Build a tic-tac-toe game on the command line
# where two human players can play against each
# other and the board is displayed in between turns.

class Game
  # controls flow of the game
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

    def initialize()
      @board_map = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
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

  def initialize(board)
    @over = false
    @board = board
    @p1_turn = true
    @winner = nil
    @current_player = 'Player 1'
    @selection = nil
  end

  # public (this is automatic, so no need to specify)

  def start
    play until @over
  end

  def play
    get_selection
    decide_what_to_do_with_tile #
    decide_winner

    if game_over?
      @board.print_board
      puts "#{@winner}, you won!"
      @over = true
    else
      @over = false
    end
  end

  private

  def get_selection
    @board.print_board
    puts "#{@current_player}, choose a tile. They are numbered 1 - 9,"\
    ' going left to right and top to bottom.'

    begin
      @selection = gets.chomp.to_i
    rescue StandardError => e
      puts "Error: #{e}"
    else
      if in_range?
        puts "You chose #{@selection}"
        @selection -= 1
      else
        puts 'Number not in range. try again'
        get_selection
      end
    end
  end

  def decide_what_to_do_with_tile
    if all_tiles_taken?
      restart
    elsif @board.chosen_tile_taken?(@selection)
      puts 'Chosen tile is taken'
      play
    else # tile is available, set tile
      set_tile
    end
  end

  def can_we_select?
    if @board.chosen_tile_taken?(@selection)
      puts 'That tile is taken; choose another.'
      get_selection
    elsif all_tiles_taken? # board is full, no options left
      puts 'You have run out of options and the game is over.'
    else
      true
    end
  end

  def restart
    @over = false
    @board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @p1_turn = true
    @winner = nil
    @current_player = 'Player 1'

    puts 'Welcome to tic tac toe. This is a 2 player game. '

    play until @over
  end

  def all_tiles_taken?
    available_tile_count = @board.count_number_of_blank_spaces

    if available_tile_count.zero?
      puts 'All tiles are taken.\n'
      puts 'The game is a draw and will now be restarted.'
      true
    else
      false
    end
  end

  def in_range?
    !@selection.zero? && @selection < 10
  end

  def set_tile
    if @p1_turn
      @board.set_tile_symbol(@selection, 'x')
      @p1_turn = false
      @current_player = 'Player 2'
    else
      @board.set_tile_symbol(@selection, 'o')
      @p1_turn = true
      @current_player = 'Player 1'
    end
  end

  def win_sequence_present?(tiles, sequence)
    # pseudocode for this logic:
    # Matching 048 in 0348 (it should do this)
    #   do tiles 0348 have a char 0? yes
    #   do tiles 0348 have a char 3? no
    #   do tiles 0348 have a char 4? yes
    #   do tiles 0348 have a char 8? yes
    # we have a least 3 hits, so we have a winning sequence
    match_count = 0
    sequence.each_char do |char|
      match_count += 1 if tiles.include?(char)
    end

    match_count == 3 # will return true or false from evaluation of the condition
  end

  def decide_winner
    # create list of tile sequences each player has
    p1_tiles = @board.create_player_sequence('x')
    p2_tiles = @board.create_player_sequence('o')

    find_winning_sequences(p1_tiles, p2_tiles)
    game_over?
  end

  def find_winning_sequences(p1_tiles, p2_tiles)
    # win sequences is array of strings
    # NEED TO CHECK FOR NON SEQUENTIAL MATCHES!
    # e.g, 0348 should match for 048
    Board::WIN_SEQUENCES.each do |sequence|
      if win_sequence_present?(p1_tiles, sequence)
        @winner = 'Player 1'
      elsif win_sequence_present?(p2_tiles, sequence)
        @winner = 'Player 2'
      end
    end
  end

  def game_over?
    if @winner == 'Player 1' || @winner == 'Player 2'
      true
    elsif all_tiles_taken? # is a draw
      puts
    else
      false
    end
  end
end

# MAIN #############
board = Game::Board.new # use this syntax when creating a nested class
game = Game.new(board)
game.start
