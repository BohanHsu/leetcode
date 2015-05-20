# @param {Integer[]} height
# @return {Integer}
def largest_rectangle_area(height)
  stack = []
  max = nil

  height.each_with_index do |cur_e, cur_i|
    if stack.empty? || cur_e >= height[stack.last]
      stack << cur_i 
    else
      while !stack.empty? && height[stack.last] > cur_e do
        dist = stack.pop

      end
      lower_bound = stack.empty? ? -1 : stack.last
      dist = cur_i - lower_bound
      local_max = dist * cur_e
      if max.nil?
        max = local_max
      else
        max = local_max if local_max > max
      end
    end
  end

  stack.each do |i|
    dist = stack.last - i + 1
    local_max = dist * height[i]
    if max.nil?
      max = local_max
    else
      max = local_max if local_max > max
    end
  end

  max.nil? ? 0 : max
end
