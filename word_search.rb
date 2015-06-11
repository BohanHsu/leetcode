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
  mask = board.map do |row|
    row.map do
      nil
    end
  end

  board.length.times do |i|
    board[i].length.times do |j|
      if board[i][j] == word[0]

        mask.each do |row|
          row.map! do
            false
          end
        end

        stack = []
        stack.push [i, j, 0]

        while !stack.empty? do
          i = stack.last[0]
          j = stack.last[1]
          k = stack.last[2]
          if k == word.length - 1
            return true
          end
          if mask[i][j]
            mask[i][j] = false
            stack.pop
            next
          else
            mask[i][j] = true
          end

          if in_board?(board, i-1, j) && board[i-1][j] == word[k+1] && !mask[i-1][j]
            stack.push [i-1, j, k+1]
          end

          if in_board?(board, i+1, j) && board[i+1][j] == word[k+1] && !mask[i+1][j]
            stack.push [i+1, j, k+1]
          end

          if in_board?(board, i, j-1) && board[i][j-1] == word[k+1] && !mask[i][j-1]
            stack.push [i, j-1, k+1]
          end

          if in_board?(board, i, j+1) && board[i][j+1] == word[k+1] && !mask[i][j+1]
            stack.push [i, j+1, k+1]
          end
        end
      end
    end
  end
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
