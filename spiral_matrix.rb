# Given a matrix of m x n elements (m rows, n columns), return all elements of 
# the matrix in spiral order.
# 
# For example,
# Given the following matrix:
# 
# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# You should return [1,2,3,6,9,8,7,4,5].

class Iterator
  attr_accessor :width, :height, :i, :j, :matrix
  def initialize(matrix, m, n, i, j)
    @matrix = matrix
    @width = m
    @height = n
    @i = i
    @j = j
    if m == 1
      @total = n
    elsif n == 1
      @total = m
    else
      @total = m * 2 + n * 2 - 4
    end
    @index = 0
  end

  def has_next?
    @index < @total
  end

  def next
    coord = next_coordinate
    @matrix[coord.first][coord.last]
  end

  def next_coordinate
    case
    when @index < @width
      res = [@i, @j + @index]
    when @width <= @index && @index < (@width + @height - 1)
      res = [@i + @index - @width + 1, @j + @width - 1]
    when (@width + @height - 1) <= @index && @index < (@width * 2 + @height - 2)
      res = [@i + @height - 1, @j + @width - (@index - @width - @height + 3)]
    when (@width * 2 + @height - 3) <= @index && @index < @total
      res = [@i + @height - 1 - (@index - (2 * @width + @height - 3)), @j]
    end
    @index += 1
    res
  end
end

# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  return [] if matrix.empty?
  sequence = []
  n = matrix.length
  m = matrix.first.length
  i = 0
  j = 0
  while n > 0 && m > 0 do
    iter = Iterator.new matrix, m, n, i, j
    while iter.has_next? do
      sequence << iter.next
    end
    n -= 2
    m -= 2
    i += 1
    j += 1
  end
  sequence
end
