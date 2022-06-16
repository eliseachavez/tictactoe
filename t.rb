# REQUIREMENTS
# Build a tic-tac-toe game on the command line
# where two human players can play against each
# other and the board is displayed in between turns.

class Game
  # true for all game instances
  @@WIN_SEQUENCES = [
    "012", "210",
    "345", "543",
    "678", "876",
    "048", "840",
    "147", "741",
    "036", "630",
    "258", "852",
    "642", "246"
  ]
  # individual game specific
  @over = false
  @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  @p1_turn = true
  @winner = nil

  def initialize
   puts "Welcome to tic tac toe. This is a 2 player game. "
    until @over do
      play
    end
  end

  public

  def play
    selection = make_selection
    if @p1_turn
      @board[selection] = 'x'
      @p1_turn = false
    else
      @board[selection] = 'o'
      @p1_turn = true # p2 is done, is now p1s turn
    end
    # now check to see if there's a hit
    if is_game_over?
      @over = true
    else
      @over = false
    end
  end

  private

  def make_selection # mark is a 'x' or 'o'
    puts "Here is the current board:"
    print_board
    puts "Choose from the remaining tiles: 1, 2, 3, 4, 5, 6, 7, 8, 9"
    begin
      selection = gets.chomp
    rescue StandardError=>e
      puts "Error: #{e}"
    else
      puts "You chose #{selection}"
      selection -= 1 # so that it's zero indexed
    end
  end # end of make_selection method

  def print_board
    @board.each_index do |index|
      print "[ "
      print @board[index]
      print " ]"
      if index == 2 || index == 5 || index == 8
        puts
      end # end of if
    end # end of do loop
  end # end of print_board method

  def is_game_over?
    # create list of tile sequences each player has
    p1_tiles = String.new("")
    p2_tiles = String.new("")
    @board.each_index do |index|
      if @board[index] == 'x'
        p1_tiles += index.to_s
      elsif @board[index] == 'o'
        p2_tiles += index.to_s
      end # end of branches
    end # end of do loop

    if @@win_sequences.include?(p1_tiles)
      @winner = "Player 1"
      true
    elsif @@win_sequences.include(p2_tiles)
      @winner = "Player 2"
      true
    else
      false
    end # end of win_sequences.include? method
  end # enf of is_over? method
end # end of class Game

# MAIN #############
game = Game.new
