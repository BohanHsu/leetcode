# Given a collection of numbers that might contain duplicates, return all possible unique permutations.

# For example,
# [1,1,2] have the following unique permutations:
# [1,1,2], [1,2,1], and [2,1,1].

# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
  return [nums] if nums.length == 1
  if nums.length == 2
    if nums.first == nums.last
      return [nums]
    else
      return [nums, nums.reverse]
    end
  end

  results = []
  hash = {}
  nums.each_with_index do |e, i|
    if !hash.include? e
      results += permute_unique(nums[0...i] + nums[i+1..-1]).map do |right_part|
        [e] + right_part
      end
      hash[e] = true
    end
  end
  results
end
