# You are a professional robber planning to rob houses along a street. Each 
# house has a certain amount of money stashed, the only constraint stopping you 
# from robbing each of them is that adjacent houses have security system 
# connected and it will automatically contact the police if two adjacent houses 
# were broken into on the same night.

# Given a list of non-negative integers representing the amount of money of 
# each house, determine the maximum amount of money you can rob tonight without 
# alerting the police.

# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  return 0 if nums.empty?
  return nums.max if nums.length <= 2

  maximum = nums.map { nil }

  maximum[0] = nums[0]
  maximum[1] = nums[1]

  (2...nums.length).each do |i|
    maximum[i] = [
      (nums[i] + maximum[i - 2]),
      (i >2 ? (nums[i] + maximum[i - 3]) : 0),
      maximum[i-1]
    ].max
  end

  return maximum.last
end
