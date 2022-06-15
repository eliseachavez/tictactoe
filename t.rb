# REQUIREMENTS
# Build a tic-tac-toe game on the command line
# where two human players can play against each
# other and the board is displayed in between turns.

# How this game logic will work:
# have a hash, with a list for each possible win sequence
# any time a player makes a move, check for win sequences in the existing sequence.

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
  i = 1
  9.times do
    Tile.new("t#{i.to_s}")
    i += 1
  end
end
