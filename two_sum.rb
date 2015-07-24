# Given an array of integers, find two numbers such that they add up to a 
# specific target number.

# The function twoSum should return indices of the two numbers such that they 
# add up to the target, where index1 must be less than index2. Please note that 
# your returned answers (both index1 and index2) are not zero-based.

# You may assume that each input would have exactly one solution.

# Input: numbers={2, 7, 11, 15}, target=9
# Output: index1=1, index2=2

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  raw_nums = nums
  nums = nums.sort
  i = 0
  j = nums.length - 1

  while i < j do
    sum = nums[i] + nums[j]
    if sum == target
      break
    elsif sum < target
      i += 1
    elsif sum > target
      j -= 1
    end
  end

  i = raw_nums.index(nums[i]) + 1

  k = 0
  while k < raw_nums.length do
    if k + 1 != i && nums[j] == raw_nums[k]
      j = k + 1
      break
    end
    k += 1
  end

  i < j ? [i, j] : [j, i]
end
