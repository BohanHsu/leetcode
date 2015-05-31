### @param {Integer[]} height
### @return {Integer}
##def largest_rectangle_area(height)
##  stack = []
##  max = nil
##
##  height.each_with_index do |elem, i|
##    if stack.empty? || elem >= height[stack.last]
##      stack << i 
##    else
##      while !stack.empty? && height[stack.last] > elem do
##        bgn = stack.pop
##        local_max = (i - bgn) * height[bgn]
##
##        if max.nil?
##          max = local_max
##        else
##          max = local_max if local_max > max
##        end
##      end
##      stack << i
##    end
##  end
##
##  while !stack.empty? do
##    bgn = stack.pop
##    local_max = (height.length - bgn) * height[bgn]
##
##    if max.nil?
##      max = local_max
##    else
##      max = local_max if local_max > max
##    end
##  end
##
##  max.nil? ? 0 : max
##end

# @param {Integer[]} height
# @return {Integer}
def largest_rectangle_area(height)
  return 0 if height.empty?
  max = nil
  s = []
  s.push [0, height.length]
  j = 0
  while !s.empty? && j < 5 do
    from = s.last[0]
    to = s.pop[1]
    middle = min_index(height, from, to)
    area = height[middle] * (to - from)
    if max.nil?
      max = area
    else
      max = area if area > max
    end

    s.push [from, middle] if middle > from
    s.push [middle + 1, to] if to > middle + 1
    
    j += 1
  end
  max
end

def min_index(arr, from, to)
  index = nil
  min = nil
  arr.each_with_index do |e, i|
    if i >= from && i < to
      if min.nil?
        min = e
        index = i
      else
        if e < min
          min = e
          index = i
        end
      end
    end
  end
  index
end
