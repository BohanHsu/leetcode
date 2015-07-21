# Given an array S of n integers, are there elements a, b, c in S such that 
# a + b + c = 0? Find all unique triplets in the array which gives the sum of 
# zero.

# Note:
# Elements in a triplet (a,b,c) must be in non-descending order. (ie, a ≤ b ≤ c)
# The solution set must not contain duplicate triplets.
# For example, given array S = {-1 0 1 2 -1 -4},
# A solution set is:
# (-1, 0, 1)
# (-1, -1, 2)

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  results = []
  hash = []
  nums.sort!

  (0..(nums.length - 3)).each do |i|
    break if nums[i] > 0
    j = i + 1
    k = nums.length - 1

    while j < k && (nums[i] + nums[j]) <= 0 do
      sum = nums[i] + nums[j] + nums[k]
      if sum < 0
        j += 1
      elsif sum > 0
        k -= 1
      elsif sum == 0
        result = [nums[i], nums[j], nums[k]]
        hash_val = hash_function result
        if hash[hash_val].nil?
          results << result
          hash[hash_val] = true
        end
        j += 1
        k -= 1
      end
    end
  end
  results
end

def hash_function(array)
  i = 1
  array.inject(0) do |memo, obj|
    i *= 100
    (obj + 10)* i + memo
  end
end
