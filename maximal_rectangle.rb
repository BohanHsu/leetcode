# Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle 
# containing all ones and return its area.

# @param {Character[][]} matrix
# @return {Integer}
def maximal_rectangle(matrix)

  return 0 if matrix.length == 0 || matrix[0].length == 0

  new_matrix = matrix.map do
    matrix[0].map do
      nil
    end
  end

  new_matrix[0].length.times do |i|
    new_matrix[0][i] = matrix[0][i].to_i
  end

  (1...matrix.length).each do |j|
    new_matrix[j].length.times do |i|
      new_matrix[j][i] = matrix[j][i] == '0' ? 0 : 1 + new_matrix[j-1][i]
    end
  end

  new_matrix.map do |line|
    maximal_rectangle_in_line line
  end.max
end

def maximal_rectangle_in_line(line)

  i = 0
  max = 0
  h = 0
  stack = []

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
        max = height * width if max < height * width
      end
      stack << i
    end

    i += 1
  end

  max
end

def largest_rectangle_area(line)
  maximal_rectangle_in_line(line)
end
