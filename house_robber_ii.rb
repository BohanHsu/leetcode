# Note: This is an extension of House Robber.

# After robbing those houses on that street, the thief has found himself a new 
# place for his thievery so that he will not get too much attention. This time, 
# all houses at this place are arranged in a circle. That means the first house 
# is the neighbor of the last one. Meanwhile, the security system for these 
# houses remain the same as for those in the previous street.

# Given a list of non-negative integers representing the amount of money of 
# each house, determine the maximum amount of money you can rob tonight without 
# alerting the police.

# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  return 0 if nums.length == 0
  return nums.max if nums.length <= 3

  return [
    rob_helper(nums[0...nums.length-1]),
    rob_helper(nums[1...nums.length])
  ].max
end

def rob_helper(nums)
  maxs = nums.map { nil }

  maxs[0] = nums[0]
  maxs[1] = nums[1]

  (2...nums.length).each do |i|
    maxs[i] = [
      i >= 3 ? maxs[i-3] + nums[i] : -1,
      maxs[i-2] + nums[i],
      maxs[i-1]
    ].max
  end
  maxs.last
end
