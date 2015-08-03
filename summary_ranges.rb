# Given a sorted integer array without duplicates, return the summary of its 
# ranges.

# For example, given [0,1,2,4,5,7], return ["0->2","4->5","7"].

# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
  results = []
  i = 0
  j = 0
  while i < nums.length do
    if i + 1 < nums.length && nums[i] + 1 == nums[i+1]
    else
      if i == j
        results << "#{nums[i]}"
      else
        results << "#{nums[j]}->#{nums[i]}"
      end

      j = i + 1
    end
    i += 1
  end
  results
end
