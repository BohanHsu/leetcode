# Given a 2D board and a word, find if the word exists in the grid.

# The word can be constructed from letters of sequentially adjacent 
# cell, where "adjacent" cells are those horizontally or vertically 
# neighboring. The same letter cell may not be used more than once.

# For example,
# Given board =
# [
#     ["ABCE"],
#     ["SFCS"],
#     ["ADEE"]
# ]
# word = "ABCCED", -> returns true,
# word = "SEE", -> returns true,
# word = "ABCB", -> returns false.

# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  return true if word.length == 0

  board.length.times do |i|
    board[i].length.times do |j|
      if board[i][j] == word[0]
        parent = {}
        stack = []
        stack.push [i, j, 0]

        while !stack.empty? do
          i = stack.last[0]
          j = stack.last[1]
          k = stack.pop[2]
          
          if k == word.length - 1
            return true
          end

          if in_board?(board, i-1, j) && board[i-1][j] == word[k+1] && !is_parent?(parent, i-1, j, i, j, k)
            stack.push [i-1, j, k+1]
            parent = set_parent(parent, i, j, i-1, j, k+1)
          end

          if in_board?(board, i+1, j) && board[i+1][j] == word[k+1] && !is_parent?(parent, i+1, j, i, j, k)
            stack.push [i+1, j, k+1]
            parent = set_parent(parent, i, j, i+1, j, k+1)
          end

          if in_board?(board, i, j-1) && board[i][j-1] == word[k+1] && !is_parent?(parent, i, j-1, i, j, k)
            stack.push [i, j-1, k+1]
            parent = set_parent(parent, i, j, i, j-1, k+1)
          end

          if in_board?(board, i, j+1) && board[i][j+1] == word[k+1] && !is_parent?(parent, i, j+1, i, j, k)
            stack.push [i, j+1, k+1]
            parent = set_parent(parent, i, j, i, j+1, k+1)
          end
        end
      end
    end
  end
  false
end

def set_parent(parent, pi, pj, ci, cj, ck)
  parent[ci] = {} if parent[ci].nil?
  parent[ci][cj] = {} if parent[ci][cj].nil?
  parent[ci][cj][ck] = [pi, pj]
  parent
end

def is_parent?(parent, pi, pj, ci, cj, ck)
  i = ci
  j = cj
  k = ck
  begin
    return false if parent[i].nil?
    return false if parent[i][j].nil?
    return false if parent[i][j][k].nil?
    p = parent[i][j][k]
    i = p[0]
    j = p[1]
    k -= 1
    return true if pi == i && pj == j
  end while !p.nil?
  false
end

def in_board?(board, i, j)
  return i >= 0 && i < board.length && j >=0 && j < board[i].length
end

def convert_board(board)
  return board.map do |row|
    row[0].split(//)
  end
end
