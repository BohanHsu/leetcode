# Given a 2D binary matrix filled with 0's and 1's, find the largest square 
# containing all 1's and return its area.

# For example, given the following matrix:

# 1 0 1 0 0
# 1 0 1 1 1
# 1 1 1 1 1
# 1 0 0 1 0
# Return 4.

# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
  return 0 if matrix.length == 0 || matrix[0].length == 0
  new_matrix = matrix.map do |line|
    line.map do
      nil
    end
  end

  new_matrix[0].length.times do |j|
    new_matrix[0][j] = matrix[0][j].to_i
  end

  (1...new_matrix.length).each do |i|
    new_matrix[i].length.times do |j|
      new_matrix[i][j] = matrix[i][j] == '0' ? 0 : new_matrix[i-1][j] + 1
    end
  end

  new_matrix.map do |line|
    maximal_square_in_line(line)
  end.max
end

def maximal_square_in_line(line)
  stack = []
  max = 0
  i = 0
  h = 0

  while i <= line.length do
    if i < line.length
      h = line[i]
    else
      h = 0
    end

    if stack.empty? || line[stack.last] < h
      stack << i
    else
      while !(stack.empty? || line[stack.last] < h) do
        height = line[stack.pop]
        width = stack.empty? ? i : i - (stack.last + 1)

        cur_area = [height, width].min ** 2
        #p "h=#{h}, height=#{height}, width=#{width}, cur_area=#{cur_area}"
        max = cur_area if max < cur_area
      end
      stack << i
    end
    i += 1
  end
  max
end
