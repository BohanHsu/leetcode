# A robot is located at the top-left corner of a m x n grid (marked 'Start' in 
# the diagram below).

# The robot can only move either down or right at any point in time. The robot 
# is trying to reach the bottom-right corner of the grid (marked 'Finish' in 
# the diagram below).

# How many possible unique paths are there?

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  paths = n.times.map do |i|
    m.times.map do |j|
      nil
    end
  end

  paths[0][0] = 1

  (1...n).each do |i|
    paths[i][0] = paths[i-1][0] + 0
  end

  (1...m).each do |j|
    paths[0][j] = paths[0][j-1] + 0
  end

  (1...n).each do |i|
    (1...m).each do |j|
      paths[i][j] = paths[i-1][j] + paths[i][j-1]
    end
  end
  paths[n-1][m-1]
end
