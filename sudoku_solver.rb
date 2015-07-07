# Write a program to solve a Sudoku puzzle by filling the empty cells.
# Empty cells are indicated by the character '.'.
# You may assume that there will be only one unique solution.

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  q = Queue.new
  first_coord = next_coordinate(board, 0, -1)
  first_values = all_possible_value(board, first_coord.first, first_coord.last)
  first_values.each do |val|
    q << { :i => first_coord.first, :j => first_coord.last, :board => board.map { |r| Array.new r }.tap { |new_board| new_board[first_coord.first][first_coord.last] = val } }
  end

  until q.empty? do
    n = q.pop
    coord = next_coordinate(n[:board], n[:i], n[:j])
    p coord
    return n[:board] if coord.nil?
    i = coord.first
    j = coord.last
    byebug if coord == [7,7]

    values = all_possible_value(n[:board], i, j)
    values.each do |val|
      q << { :i => i, :j => j, :board => n[:board].map { |r| Array.new r }.tap { |new_board| new_board[i][j] = val } }
    end
  end
end

def all_possible_value(board, coord_i, coord_j)
  values = (1..9).map do |i|
    i.to_s
  end

  board[coord_i].each do |e|
    values.delete(e) unless e.nil?
  end

  board.each do |row|
    e = row[coord_j]
    values.delete(e) unless e.nil?
  end

  base_i = coord_i / 3 * 3
  base_j = coord_j / 3 * 3

  3.times do |i|
    3.times do |j|
      e = board[base_i + i][base_j + j]
      values.delete(e) unless e.nil?
    end
  end
  values
end

def next_coordinate(board, i, j)
  ((j+1)...board[i].length).each do |new_j|
    return [i, new_j] if board[i][new_j] == '.'
  end
  ((i+1)...board.length).each do |new_i|
    board[new_i].length.times do |new_j|
      return [new_i, new_j] if board[new_i][new_j] == '.'
    end
  end
  nil
end

#def solve_sudoku(board)
#  q = Queue.new
#  first_coord = next_coordinate(board, 0, -1)
#  f_i = first_coord.first
#  f_j = first_coord.last
#
#  first_values = all_possible_value(board, nil, f_i, f_j)
#
#  first_values.each do |val|
#    q << {:i => f_i, :j => f_j, :val => val }
#  end
#
#  until q.empty? do
#    node = q.pop
#
#    next_coord = next_coordinate(board, node[:i], node[:j])
#    if next_coord.nil?
#      return fill_board(board, node)
#    end
#
#    next_i = next_coord.first
#    next_j = next_coord.last
#
#    next_values = all_possible_value(board, node, next_i, next_j)
#
#    next_values.each do |val|
#      q << { :i => next_i, :j => next_j, :val => val, :prev => node }
#    end
#  end
#end
#
#def fill_board(board, node)
#  until node.nil? do
#    board[node[:i]][node[:j]] = node[:val]
#    node = node[:prev]
#  end
#  board
#end
#
## board, 0, -1 will return first coordinate
#def next_coordinate(board, i, j)
#  ((j+1)...board[i].length).each do |new_j|
#    return [i, new_j] if board[i][new_j] == '.'
#  end
#  ((i+1)...board.length).each do |new_i|
#    board[new_i].length.times do |new_j|
#      return [new_i, new_j] if board[new_i][new_j] == '.'
#    end
#  end
#  nil
#end
#
#def all_possible_value(board, node, coord_i, coord_j)
#  occupied = {}
#  until node.nil? do
#    occupied[node[:i]] = {} if occupied[node[:i]].nil?
#    occupied[node[:i]][node[:j]] = node[:val]
#    node = node[:prev]
#  end
#
#  values = (1..9).map do |i|
#    i.to_s
#  end
#
#  board.length.times do |i|
#    values.delete(board[i][coord_j]) unless board[i][coord_j].nil?
#    values.delete(occupied[i][coord_j]) unless occupied[i].nil? || occupied[i][coord_j].nil?
#  end
#
#  board[coord_i].length.times do |j|
#    values.delete(board[coord_i][j]) unless board[coord_i][j].nil?
#    values.delete(occupied[coord_i][j]) unless occupied[coord_i].nil? || occupied[coord_i][j].nil?
#  end
#
#  3.times do |i|
#    3.times do |j|
#      new_i = (coord_i / 3) * 3 + i
#      new_j = (coord_j / 3) * 3 + j
#
#      values.delete(board[new_i][new_j]) unless board[new_i][new_j].nil?
#      values.delete(occupied[new_i][new_j]) unless occupied[new_i].nil? || occupied[new_i][new_j].nil?
#    end
#  end
#
#  values
#end
