# REQUIREMENTS
# Build a tic-tac-toe game on the command line
# where two human players can play against each
# other and the board is displayed in between turns.

class Game
  # true for all game instances
  WIN_SEQUENCES = [
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
    @current_player = "Player 1"
    puts "Welcome to tic tac toe. This is a 2 player game. "
    until @over do
      play
    end
  end

  public

  def play
    selection = data_intake

    if all_tiles_taken?
      puts "all tiles are taken"
      puts "The game is a draw. Game will now be restarted"
      restart
    elsif is_chosen_tile_taken?(selection)
      puts "chosen tile is taken"
      play
    else # tile is available
      select(selection)
    end

    # now check to see if there's a hit
    if is_game_over?
      puts "#{@winner}, you won!"
      @over = true
    elsif is_draw?
      @over = false
    else
      @over = false
    end

  end

  private

  def can_we_select?(selection)
    if is_chosen_tile_taken?(selection)
      puts "That tile is taken; choose another."
      selection = data_intake
    elsif all_tiles_taken? # board is full, no options left
      puts "You have run out of options and the game is over."
    else
    end
  end

  def restart
    @over = false
    @board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @p1_turn = true
    @winner = nil
    @current_player = "Player 1"
    puts "Welcome to tic tac toe. This is a 2 player game. "
    until @over do
      play
    end
  end

  def select(selection)
    if @p1_turn
      @board[selection] = 'x'
      @p1_turn = false
      @current_player = "Player 2"
    else
      @board[selection] = 'o'
      @p1_turn = true
      @current_player = "Player 1"
    end
  end

  def all_tiles_taken?
    nil_count = 0
    @board.each_index do |index|
      if @board[index] == ' '
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

  def is_chosen_tile_taken?(selection)
    if @board[selection] == 'x' || @board[selection] == 'o'
      true
    else
      false
    end
  end

  def data_intake # mark is a 'x' or 'o'
    print_board
    puts "#{@current_player}, choose from the remaining tiles: 1, 2, 3, 4, 5, 6, 7, 8, 9"

    begin
      selection = gets.chomp.to_i
    rescue StandardError=>e
      puts "Error: #{e}"
    else
      if in_range?(selection)
        puts "You chose #{selection}"
        selection -= 1 # so that it's zero indexed
        puts "but the index you chose is #{selection}"
        selection
      else
        puts "Number not in range. try again"
        data_intake
      end
    end
  end

  def in_range?(selection)
    if selection > 0 && selection < 10
      true
    else
      false
    end
  end

  def print_board
    @board.each_index do |index|
      print "[ "
      if @board[index] == 'x' || @board[index] == 'o'
        print @board[index]
      else
        print ' '
      end
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
    # win sequences is array of strings
    Game::WIN_SEQUENCES.each do |sequence|
      if p1_tiles.include?(sequence)
        @winner = "Player 1"
      elsif p2_tiles.include?(sequence)
        @winner = "Player 2"
      end
    end

    if @winner == "Player 1" || @winner == "Player 2"
      true
    else
      false
    end
  end
end

# MAIN #############
game = Game.new
