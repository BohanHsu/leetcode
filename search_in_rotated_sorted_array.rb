# Suppose a sorted array is rotated at some pivot unknown to you beforehand.
# 
# (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
# 
# You are given a target value to search. If found in the array return its 
# index, otherwise return -1.
# 
# You may assume no duplicate exists in the array.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  from = 0
  to = nums.length - 1


end

def sorted?(nums, from, to)
  return nums[from] < nums[to]
end
