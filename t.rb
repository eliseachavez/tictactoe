# REQUIREMENTS
# Build a tic-tac-toe game on the command line
# where two human players can play against each
# other and the board is displayed in between turns.

# How this game logic will work:
# have a hash, with a list for each possible win sequence
# any time a player makes a move, check for win sequences in the existing sequence.
$turn = true
$over = false
win_sequences = [
  ["nw-nc-ne"], ["ne-nc-nw"],
  ["wc-c-ec"], ["ec-c-wc"],
  ["sw-sc-se"], ["se-sc-sw"],
  ["nw-c-se"], ["se-c-nw"],
  ["nc-c-sc"], ["sc-c-nc"],
  ["nw-wc-sw"], ["sw-wc-nw"],
  ["ne-ec-se"], ["se-ec-ne"],
  ["sw-c-ne"], ["ne-c-sw"]
]
class Tile
  def initialize(name)
    @name = name
  end

  public

  def choose_tile
  # add a neighbor
    puts "hi"
  end
end

def make_board
  t1 = Tile.new("t1")
  t2 = Tile.new("t2")
  t3 = Tile.new("t3")
  t4 = Tile.new("t4")
  t5 = Tile.new("t5")
  t6 = Tile.new("t6")
  t7 = Tile.new("t7")
  t8 = Tile.new("t8")
  t9 =Tile.new("t9")
end

def prompt_turn
  selection = nil
  if $turn == true
    turn = !turn
    puts "Player 1, it is your turn"
    get_input
  else
    turn = !turn
    puts "Player 2, it is your turn"
    get_input
  end
end

def get_input
  puts "Here is the current board;"
  puts "Choose from the remaining tiles."
  print_board
  begin
    selection = gets.chomp
  rescue StandardError=>e
    puts "Error: #{e}"
  else
    puts "You chose #{selection}"
    index = $board.index(selection)
    # now get the tile object that corresponds
    choose_tile($board[index])
  end
end

#def print_board
  #board_rows = [["___"], ["___"], ["___"]]
  #board_columns = [["|"], ["|"], ["|"]]
#  puts " ___ ___ ___ "
#  3.times do
#    print "|"
#    3.times do
#      print "___"
#      1.times do
#        print "|"
#      end
#    end
#    puts
#  end
#end

def print_board
 board = {
  t1: t1,

 }
  3 times (so below is individual row)
end

# MAIN #############
make_board

until $over do
  prompt_turn
end
