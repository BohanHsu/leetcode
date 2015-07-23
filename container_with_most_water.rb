# Given n non-negative integers a1, a2, ..., an, where each represents a point 
# at coordinate (i, ai). n vertical lines are drawn such that the two endpoints 
# of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis 
# forms a container, such that the container contains the most water.

# Note: You may not slant the container.

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  i = 0
  j = height.length - 1
  max = 0

  while i < j do
    area = [height[i], height[j]].min * (j - i)
    max = area if area > max

    if height[i] < height[j]
      #while height[i] < height[j] && i < j do
      #  i += 1
      #end
      i += 1
    else
      #while height[j] <= height[i] && i < j do
      #  j -= 1
      #end
      j -= 1
    end
  end
  max
end
