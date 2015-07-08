# Given a sorted array of integers, find the starting and ending position of a given target value.
# Your algorithm's runtime complexity must be in the order of O(log n).
# If the target is not found in the array, return [-1, -1].

# For example,
# Given [5, 7, 7, 8, 8, 10] and target value 8,
# return [3, 4].

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)

  r_start = nums.length
  begin 
    found = binary_search(nums, target, 0, r_start)
    if !found.nil?
      r_start = found
    end
  end while !found.nil?
  return [-1, -1] if r_start == nums.length

  r_end = r_start + 1
  begin
    found = binary_search(nums, target, r_end, nums.length)
    if !found.nil?
      r_end = found + 1
    end
  end while !found.nil?
  [r_start, r_end - 1]
end

def binary_search(nums, target, f, t)
  return nil if t - f == 0
  return (nums[f] == target ? f : nil) if t - f == 1

  from = f
  to = t

  while to - from > 1 do
    return to if to < t && target == nums[to]
    return from if target == nums[from]
    i = (to + from) / 2
    return i if target == nums[i]
    if target < nums[i]
      to = i
    else
      from = i
    end
  end
  nil
end
