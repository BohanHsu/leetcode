# Write a program to solve a Sudoku puzzle by filling the empty cells.
# Empty cells are indicated by the character '.'.
# You may assume that there will be only one unique solution.

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  q = []
  first_coord = next_coordinate(board, 0, -1)
  first_values = all_possible_value(board, first_coord.first, first_coord.last)
  first_values.each do |val|
    q << { :i => first_coord.first, :j => first_coord.last, :board => board.map { |r| Array.new r }.tap { |new_board| new_board[first_coord.first][first_coord.last] = val } }
  end

  until q.empty? do
    n = q.pop
    byebug unless n[:board].length == 9
    coord = next_coordinate(n[:board], n[:i], n[:j])
    if coord.nil?
      height = n[:board].length
      width = n[:board][0].length
      (0...height).each do |i|
        (0...width).each do |j|
          board[i][j] = n[:board][i][j]
        end
      end
      return
    end
    i = coord.first
    j = coord.last

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
