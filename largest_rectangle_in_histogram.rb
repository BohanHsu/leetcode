# Given n non-negative integers representing the histogram's bar height where 
# the width of each bar is 1, find the area of largest rectangle in the 
# histogram.

# @param {Integer[]} height
# @return {Integer}
def largest_rectangle_area(height)
  stack = []
  i = 0
  max = 0

  while i <= height.length do
    if i < height.length
      h = height[i]
    else
      h = 0
    end

    if stack.empty? || height[stack.last] < h
      stack << i
    else
      while !(stack.empty? || height[stack.last] < h) do
        cur_height = height[stack.pop]
        width = stack.empty? ? i : i - stack.last - 1
        if max < cur_height * width
          max = cur_height * width 
          #p "stack=#{stack}, h=#{h}, i=#{i}, width=#{width}, heigth=#{cur_height}"
          #p max
        end
      end
      stack << i
    end
    i += 1
  end
  max
end
