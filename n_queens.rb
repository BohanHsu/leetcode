# The n-queens puzzle is the problem of placing n queens on an n×n chessboard
# such that no two queens attack each other.



# Given an integer n, return all distinct solutions to the n-queens puzzle.

# Each solution contains a distinct board configuration of the n-queens' 
# placement, where 'Q' and '.' both indicate a queen and an empty space 
# respectively.

# For example,
# There exist two distinct solutions to the 4-queens puzzle:

# [
#  [".Q..",  // Solution 1
#   "...Q",
#   "Q...",
#  "..Q."],

#  ["..Q.",  // Solution 2
#   "Q...",
#   "...Q",
#   ".Q.."]
#  ]

# @param {Integer} n
# @return {String[][]}
def solve_n_queens(n)
  return [['Q']] if n == 1
  results = []
  parent = {}
  n.times do |i|
    parent[i] = {}
  end
  stack = []

  n.times do |start_j|
    stack << [0, start_j]
    until stack.empty? do
      coord = stack.pop
      i = coord.first
      j = coord.last
      new_i = i + 1
      n.times do |new_j|
        if new_queen_safe?(parent, i, j, new_i, new_j)
          parent[new_i][new_j] = j
          if new_i == n - 1
            results << parent_to_board(parent, new_i, new_j)
          else
            stack << [new_i, new_j]
          end
        end
      end
    end
  end
  results
end

def parent_to_board(parent, i, j)
  board = (i + 1).times.map do
    (i + 1).times.map do
      '.'
    end
  end

  while i > -1 do
    board[i][j] = 'Q'
    j = parent[i][j]
    i -= 1
  end

  return board.map do |row|
    row.join ""
  end
end

def new_queen_safe?(parent, i, j, new_i, new_j)
  begin 
    return false if i == new_i || j == new_j || (i - new_i).abs == (j - new_j).abs
    j = parent[i][j]
    i -= 1
    return true if i == -1 || j.nil?
  end while true
end
