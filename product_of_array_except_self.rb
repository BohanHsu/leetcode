# Given an array of n integers where n > 1, nums, return an array output such 
# that output[i] is equal to the product of all the elements of nums except 
# nums[i].

# Solve it without division and in O(n).

# For example, given [1,2,3,4], return [24,12,8,6].

# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  output = nums.map { nil }
  output[-1] = 1

  (1...nums.length).each do |i|
    output[nums.length - 1 - i] = nums[nums.length - i] * output[nums.length - i]
  end

  accu = nums[0]
  (1...nums.length).each do |i|
    output[i] = accu * output[i]
    accu *= nums[i]
  end

  output
end
