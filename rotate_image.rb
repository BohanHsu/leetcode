# You are given an n x n 2D matrix representing an image.
# Rotate the image by 90 degrees (clockwise).
# Follow up:
# Could you do this in-place?

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  len = matrix.length
  (len / 2).times do |i|
    ((len + 1) / 2).times do |j|
      tmp = matrix[i][j]
      matrix[i][j] = matrix[len-1-j][i]
      matrix[len-1-j][i] = matrix[len-1-i][len-1-j]
      matrix[len-1-i][len-1-j] = matrix[j][len-1-i]
      matrix[j][len-1-i] = tmp
    end
  end
  nil
end
