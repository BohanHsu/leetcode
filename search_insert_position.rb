# Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

# You may assume no duplicates in the array.

# Here are few examples.
# [1,3,5,6], 5 → 2
# [1,3,5,6], 2 → 1
# [1,3,5,6], 7 → 4
# [1,3,5,6], 0 → 0

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  return 0 if nums.length == 0
  if nums.length == 1
    if target <= nums.first
      return 0
    else
      return 1
    end
  end

  return 0 if target < nums.first

  from = 0
  to = nums.length

  while to - from > 1 do
    return to if target == nums[to]
    return from if target == nums[from]
    i = (to + from) / 2
    return i if target == nums[i]
    if target < nums[i]
      to = i
    else
      from = i
    end
  end
  to
end
