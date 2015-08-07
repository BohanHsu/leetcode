# Given a collection of integers that might contain duplicates, nums, return all possible subsets.

# Note:
#   Elements in a subset must be in non-descending order.
#   The solution set must not contain duplicate subsets.
#   For example,
#   If nums = [1,2,2], a solution is:
# 
#   [
#     [2],
#     [1],
#     [1,2,2],
#     [2,2],
#     [1,2],
#     []
#   ]

# @param {Integer[]} nums
# @return {Integer[][]}
def subsets_with_dup(nums)
  length = nums.length
  indices = []
  (1..length).each do |k|
    indices += combine(length, k)
  end
  
  h = {}

  results = indices.map do |ind_row|
    set = ind_row.map do |i|
      nums[i-1]
    end.sort
    hash_val = hash_func(nums.length, set)
    if h[hash_val].nil?
      h[hash_val] = true
      set
    else
      nil
    end
  end
  results << []
  results.select do |e|
    !e.nil?
  end
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

def hash_func(length, arr)
  base = 1
  arr.map do |e|
    e * (base *= 10)
  end.inject(0) do |memo, obj|
    memo + obj
  end / 10 + (base * 10)
end
