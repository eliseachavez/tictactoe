# frozen_string_literal: true

# REQUIREMENTS
# Build a tic-tac-toe game on the command line
# where two human players can play against each
# other and the board is displayed in between turns.

board = Game::Board.new # use this syntax when creating a nested class
game = Game.new(board)
game.start
