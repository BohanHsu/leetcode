# Given a 2d grid map of '1's (land) and '0's (water), count the number of 
# islands. An island is surrounded by water and is formed by connecting adjacent
# lands horizontally or vertically. You may assume all four edges of the grid 
# are all surrounded by water.

# Example 1:

# 11110
# 11010
# 11000
# 00000
# Answer: 1
# 
# Example 2:
# 
# 11000
# 11000
# 00100
# 00011
# Answer: 3

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  height = grid.length
  return 0 if height == 0
  width = grid.first.length
  return 0 if width == 0

  count = 0
  queue = []
  i = 0

  while i < height do
    j = 0
    while j < width do
      if grid[i][j] == '1'
        queue << [i, j]
        grid[i][j] = '0'
        count += 1
        while !queue.empty? do
          coord = queue.shift
          y = coord.first
          x = coord.last
          if y + 1 < height && grid[y+1][x] == '1'
            queue << [y+1, x] 
            grid[y+1][x] = '0'
          end
          if y - 1 >= 0 && grid[y-1][x] == '1'
            queue << [y-1, x]
            grid[y-1][x] = '0'
          end
          if x + 1 < width && grid[y][x+1] == '1'
            queue << [y, x+1] 
            grid[y][x+1] = '0'
          end
          if x - 1 >= 0 && grid[y][x-1] == '1'
            queue << [y, x-1]
            grid[y][x-1] = '0'
          end
        end
      end
      j += 1
    end
    i += 1
  end
  count
end
