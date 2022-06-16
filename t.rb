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

  def initialize
    # individual game specific
    @over = false
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @p1_turn = true
    @winner = nil
   puts "Welcome to tic tac toe. This is a 2 player game. "
    until @over do
      play
    end
  end

  public

  def play
    selection = make_selection
    if @p1_turn
      if is_taken?(selection)
        puts "That tile is taken; choose another."
        selection = make_selection
      elsif all_tiles_taken?#board is full, no options left
        puts "You have run out of options and the game is over."
      else
        @board[selection] = 'x'
        @p1_turn = false
      end
    else
      if is_taken?(selection)
        puts "That tile is taken; choose another."
        selection = make_selection
      else
        @board[selection] = 'o'
        @p1_turn = true # p2 is done, is now p1s turn
      end
    end
    # now check to see if there's a hit
    if is_game_over?
      puts "You won!"
      @over = true
    elsif is_draw?
      @over = false
    else
      @over = false
    end
  end

  private

  def all_tiles_taken?
    nil_count = 0
    @board.each_index do |index|
      if @board[index] = ' '
        nil_count += 1
      end
    end

    if nil_count > 0
      false
    else
      true
    end

  end

  def is_draw?
    x_count = 0
    o_count = 0
    @board.each_index do |index|
      if @board[index] == 'x'
        x_count += 1
      elsif @board[index] == 'o'
        o_count += 1
      end
    end
    if x_count == o_count
      true
    else
      false
    end
  end

  def is_taken?(selection)
    if @board[selection] == 'x' || @board[selection] == 'o'
      true
    else
      false
    end
  end

  def make_selection # mark is a 'x' or 'o'
    puts "Here is the current board."
    print_board
    if @p1_turn
      puts "Player 1, choose from the remaining tiles: 1, 2, 3, 4, 5, 6, 7, 8, 9"
    else
      puts "Player 2, choose from the remaining tiles: 1, 2, 3, 4, 5, 6, 7, 8, 9"
    end

    begin
      selection = gets.chomp.to_i
    rescue StandardError=>e
      puts "Error: #{e}"
    else
      puts "You chose #{selection}"
      print_board
      selection -= 1 # so that it's zero indexed
      puts "but the index you chose is #{selection}"
      selection
    end
  end

  def print_board
    @board.each_index do |index|
      print "[ "
      print @board[index]
      print " ]"
      if index == 2 || index == 5 || index == 8
        puts
      end
    end
  end

  def is_game_over?
    # create list of tile sequences each player has
    p1_tiles = String.new("")
    p2_tiles = String.new("")
    @board.each_index do |index|
      if @board[index] == 'x'
        p1_tiles += index.to_s
      elsif @board[index] == 'o'
        p2_tiles += index.to_s
      end
    end

    if @@WIN_SEQUENCES.include?(p1_tiles)
      @winner = "Player 1"
      true
    elsif @@WIN_SEQUENCES.include?(p2_tiles)
      @winner = "Player 2"
      true
    else
      false
    end
  end
end

# MAIN #############
game = Game.new
