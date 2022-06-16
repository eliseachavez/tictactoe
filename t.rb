# REQUIREMENTS
# Build a tic-tac-toe game on the command line
# where two human players can play against each
# other and the board is displayed in between turns.

class Game
  # true for all game instances
  @@win_sequences = [
    ["012"], ["210"],
    ["345"], ["543"],
    ["678"], ["876"],
    ["048"], ["840"],
    ["147"], ["741"],
    ["036"], ["630"],
    ["258"], ["852"],
    ["642"], ["246"]
  ]
  # individual game specific
  attr_accessor @over = false
  @board = [' ', 'x', ' ', ' ', ' ', 'x', 'x', 'o', 'o']
  @p1_turn = true

  def initialize
   puts "Welcome to tic tac toe. This is a 2 player game. "
    until Game.@over do
      Game.play
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
    is_game_over?
  end

  private

  def make_selection(mark) # mark is a 'x' or 'o'
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
    #compare win sequences to x or o
    @@win_sequences = [
      ["012"], ["210"],
      ["345"], ["543"],
      ["678"], ["876"],
      ["048"], ["840"],
      ["147"], ["741"],
      ["036"], ["630"],
      ["258"], ["852"],
      ["642"], ["246"]
    ]
  end
end

# MAIN #############
game = Game.new
