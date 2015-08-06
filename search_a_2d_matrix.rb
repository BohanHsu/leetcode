# Write an efficient algorithm that searches for a value in an m x n matrix. 
# This matrix has the following properties:
# 
# Integers in each row are sorted from left to right.
# The first integer of each row is greater than the last integer of the previous 
# row.
# For example,
# 
# Consider the following matrix:
# 
# [
#   [1,   3,  5,  7],
#   [10, 11, 16, 20],
#   [23, 30, 34, 50]
# ]
# Given target = 3, return true.

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if target < matrix[0][0]
  selected_row = nil
  if target <= matrix[-1][0]
    from = 0
    to = matrix.length - 1
    while to - from > 1 do
      i = (from + to) / 2
      if matrix[i][0] == target
        return true
      elsif matrix[i][0] < target
        from = i
      elsif matrix[i][0] > target
        to = i
      end
    end
    if from == to && matrix[from][0] <= target
      selected_row = matrix[from]
    end
    if matrix[from][0] < target && target < matrix[to][0]
      selected_row = matrix[from]
    end
  else
    selected_row = matrix.last
  end
  
  from = 0
  to = selected_row.length - 1
  while to - from > 1 do
    i = (from + to) / 2
    if selected_row[i] == target
      return true
    elsif selected_row[i] < target
      from = i
    elsif selected_row[i] > target
      to = i
    end
  end
  return true if from == to && selected_row[from] == target
  return true if selected_row[to] == target || selected_row[from] == target
  return false if selected_row[from] < target && target < selected_row[to]
  false
end
