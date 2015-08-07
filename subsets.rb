# Given a set of distinct integers, nums, return all possible subsets.
# 
# Note:
# Elements in a subset must be in non-descending order.
# The solution set must not contain duplicate subsets.
# For example,
# If nums = [1,2,3], a solution is:
# 
# [
#   [3],
#   [1],
#   [2],
#   [1,2,3],
#   [1,3],
#   [2,3],
#   [1,2],
#   []
# ]

# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  length = nums.length
  indices = []
  (1..length).each do |k|
    indices += combine(length, k)
  end

  results = indices.map do |ind_row|
    ind_row.map do |i|
      nums[i-1]
    end.sort
  end
  results << []
end

def combine(n, k)
  if k == 1
    return n.times.map do |i|
      [i + 1]
    end
  else
    results = []
    ((k-n)..n).each do |last_element|
      results += combine(last_element-1, k-1).map do |elem|
        elem += [last_element]
      end
    end
  end
  results
end
