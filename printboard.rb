board = [
  ' ',
  'x',
  ' ',
  ' ',
  ' ',
  'x',
  'x',
  'o',
  'o'
] # array of markers of which tiles has a tile placed

board.each_index do |index|
  print "[ "
  print board[index]
  print " ]"
  if index == 2 || index == 5 || index == 8
    puts
  end
end
