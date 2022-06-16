# REQUIREMENTS
# Build a tic-tac-toe game on the command line
# where two human players can play against each
# other and the board is displayed in between turns.

# How this game logic will work:
# have a hash, with a list for each possible win sequence
# any time a player makes a move, check for win sequences in the existing sequence.
$turn = true
$over = false
win_sequences = [[NWNCNE],[],[],[],[],[],[],[]]
class Tile
  @name, @neighbors
  def initialize(name)
    @name = name
  end

  private

  def choose_tile
  # add a neighbor

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
  if $turn == true
    turn = !turn
    puts "Player 1, enter the tile of your choice"
  else
    turn = !turn
    puts "Player 2, enter the tile of your choice"
  end
end

# MAIN #############

until over do
  prompt_turn
end
