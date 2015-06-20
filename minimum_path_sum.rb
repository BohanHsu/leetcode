# Given a m x n grid filled with non-negative numbers, find a path from top 
# left to bottom right which minimizes the sum of all numbers along its path.
# Note: You can only move either down or right at any point in time.

# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
  distance = grid.each do |row|
    row.map do
      nil
    end
  end

  distance[0][0] = grid[0][0]

  (1...distance.length).each do |i|
    distance[i][0] = distance[i-1][0] + grid[i][0]
  end

  (1...distance[0].length).each do |i|
    distance[0][i] = distance[0][i-1] + grid[0][i]
  end

  (1...distance.length).each do |i|
    (1...distance[i].length).each do |j|
      distance[i][j] = [
        distance[i-1][j],
        distance[i][j-1]
      ].min + grid[i][j]
    end
  end
  distance[grid.length-1][grid.last.length-1]
end
