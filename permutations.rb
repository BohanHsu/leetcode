# Given a collection of numbers, return all possible permutations.
# For example,
# [1,2,3] have the following permutations:
# [1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], and [3,2,1].

# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  return [nums] if nums.length == 1
  return [] << nums << nums.reverse if nums.length == 2

  results = []
  nums.each_with_index do |e, i|
    results += permute(nums[0...i] + nums[i+1..-1]).map do |right_part|
      [e] + right_part
    end
  end
  results
end
