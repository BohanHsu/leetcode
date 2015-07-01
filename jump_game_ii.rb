# Given an array of non-negative integers, you are initially positioned at the 
# first index of the array.
# Each element in the array represents your maximum jump length at that 
# position.
# Your goal is to reach the last index in the minimum number of jumps.
# For example:
# Given array A = [2,3,1,1,4]
# The minimum number of jumps to reach the last index is 2. (Jump 1 step from 
# index 0 to 1, then 3 steps to the last index.)

# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  return 0 if nums.length == 1
  from = 0
  to = 0
  jump = 0

  while to < nums.length do
    max = 0
    jump += 1
    (from..to).each do |i|
      max = [max, nums[i] + i].max
      return jump if max >= nums.length - 1
    end
    from = to + 1
    to = max
  end
  jump
end
