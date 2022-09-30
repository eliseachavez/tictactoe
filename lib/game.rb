# frozen_string_literal: true

# REQUIREMENTS
# Build a tic-tac-toe game on the command line
# where two human players can play against each
# other and the board is displayed in between turns.

class Game
  # controls flow of the game

  def initialize(board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    # don't test this because it's only initilializing instance variables
    @over = false
    @board = board
    @p1_turn = true
    @winner = nil
    @current_player = 'Player 1'
    @selection = nil
    @draw = false
  end

  # public (this is automatic, so no need to specify)

  def start
    # looping script, test condition? test if play call is received (?) if over variable is true (and vice versa)
    play until @over
  end

  def play
    # public script, test each method
    get_selection
    decide_what_to_do_with_tile #
    decide_winner
    game_over_sequence
  end

  def game_over_sequence
    # script? and also...changes state, so a command..?
    # over should be tree if win message happens
    # if game over is true, show board call should happen
    # over should be false if game over is false
    if game_over?
      show_board
      puts "#{@winner}, you won!" unless @draw
      @over = true
    else
      @over = false
    end
  end

  def show_board
    # outgoing command, test that message received by board
    @board.print_board
  end

  def get_selection
    # I think this is a script...
    # test that outgoing command, print board happens
    # don't need to test that puts happens bc it's not a symptom of a condition, it just happens
    # allow gets and return a proper selection, and  selection out of range, and a completely invalid selection that throws an error
    # test that selection out of range leads to selection out of range message, test that get_selection command sent? no, it's not outgoing. just make sure to stub get_selection
    # if in range, test that selection is decrement and message happens
    # if completely invalid, test that an exception was thrown and an error message happened
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
    # Script. Test methods in it
    #   all_tiles_taken? -- Is command, test changes in observable state
    #       Is it true if all tiles are taken (needs to be set in creation of subject), 
    #       Or false if not all taken?
    #   chosen_tile_taken?  -- Is outoging query 
    #       1) Was it received? (bc it's outgoing)
    #       2) Test return value -- Is it taken or no, based on the selection? (prob need to set the selection var? and determine board?)
    #   puts message of tile being taken -- test that puts message HAPPENS with tile being taken
    #   restart - command, private method. Because it's private, we don't test that method on its own
    #       Instead, it gets test coverage through testing of this script method
    #       So what are we testing? Changes in observable state. We should see values of the instance variables
    if all_tiles_taken?
      restart
    elsif @board.chosen_tile_taken?(@selection)
      puts 'Chosen tile is taken'
      play
    else # tile is available, set tile
      set_tile
    end
  end

  def decide_winner
    # create list of tile sequences each player has
    # script
    # test outgoing command create player sequence to see if received
    p1_tiles = @board.create_player_sequence('x')
    p2_tiles = @board.create_player_sequence('o')

    find_winning_sequences(p1_tiles, p2_tiles)
    game_over?
  end

  def game_over?
    # script since it calls all tiles taken
    # does it return true if we have a winner?
    # does it puts if all tiles taken?
    if @winner == 'Player 1' || @winner == 'Player 2'
      true
    elsif all_tiles_taken? # is a draw
      puts "This game was a draw."
      @draw = true
    else
      false
    end
  end

  private
  #test all the methods except find_winning_sequences as it is the only one not called from a public method?

  # def can_we_select?
  #   if @board.chosen_tile_taken?(@selection)
  #     puts 'That tile is taken; choose another.'
  #     get_selection
  #   elsif all_tiles_taken? # board is full, no options left
  #     puts 'You have run out of options and the game is over.'
  #   else
  #     true
  #   end
  # end

  def restart
    @over = false
    @board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @p1_turn = true
    @winner = nil
    @current_player = 'Player 1'
    @draw = false

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
end
