# Given an integer n, generate a square matrix filled with elements from 1 to 
# n^2 in spiral order.
# 
# For example,
# Given n = 3,
# 
# You should return the following matrix:
# [
#  [ 1, 2, 3 ],
#  [ 8, 9, 4 ],
#  [ 7, 6, 5 ]
# ]

class Iterator
  attr_accessor :width, :height, :i, :j
  def initialize(n, i, j)
    @width = n
    @height = n
    @i = i
    @j = j
    if n == 1
      @total = n
    else
      @total = n * 4 - 4
    end
    @index = 0
  end

  def has_next?
    @index < @total
  end

  def next
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

# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
  return [] if n == 0
  matrix = n.times.map do
    n.times.map do
      nil
    end
  end

  i = 0
  j = 0

  iter = Iterator.new n, i, j

  (n ** 2).times do |index|
    if !iter.has_next?
      n -= 2
      i += 1
      j += 1
      iter = Iterator.new n, i, j
    end
    coord = iter.next
    #p "index=#{index}, coord=#{coord}"
    matrix[coord.first][coord.last] = index + 1
  end
  matrix
end
