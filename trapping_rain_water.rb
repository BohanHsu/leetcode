# Given n non-negative integers representing an elevation map where the width 
# of each bar is 1, compute how much water it is able to trap after raining.

# For example, 
# Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.

# @param {Integer[]} height
# @return {Integer}
def t(height)
  return if height.class == String 
  water = 0
  stack = []
  height.each_with_index do |e, i|
    if stack.empty? || e < height[stack.last]
      stack << i
    else
      min = height[stack.first] < e ? height[stack.first] : e

      while !stack.empty? && height[stack.last] < e do
        if stack.length > 1
          water += (min - height[stack.last]) * (stack.pop - stack.last)
        else
          stack.pop
        end
      end

      stack << i
    end
  end
  water
end
