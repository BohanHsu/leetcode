# Follow up for "Unique Paths":
# Now consider if some obstacles are added to the grids. How many unique paths 
# would there be?
# An obstacle and empty space is marked as 1 and 0 respectively in the grid.
# For example,
# There is one obstacle in the middle of a 3x3 grid as illustrated below.
# [
#   [0,0,0],
#   [0,1,0],
#   [0,0,0]
# ]
# The total number of unique paths is 2.
# Note: m and n will be at most 100.

# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  paths = obstacle_grid.map do |row|
    row.map do
      nil
    end
  end

  m = obstacle_grid.first.length
  n = obstacle_grid.length

  paths[0][0] = 1 - obstacle_grid[0][0]

  (1...n).each do |i|
    paths[i][0] = obstacle_grid[i][0] == 1 ? 0 : paths[i-1][0] + 0
  end

  (1...m).each do |j|
    paths[0][j] = obstacle_grid[0][j] == 1 ? 0 : paths[0][j-1] + 0
  end

  (1...n).each do |i|
    (1...m).each do |j|
      paths[i][j] = obstacle_grid[i][j] == 1 ? 0 : paths[i-1][j] + paths[i][j-1]
    end
  end
  paths[n-1][m-1]
end
