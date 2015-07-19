# Given an array S of n integers, are there elements a, b, c, and d in S such
# that a + b + c + d = target? Find all unique quadruplets in the array which
# gives the sum of target.

# Note:
# Elements in a quadruplet (a,b,c,d) must be in non-descending order. (ie, a ≤ b ≤ c ≤ d)
# The solution set must not contain duplicate quadruplets.
# For example, given array S = {1 0 -1 0 -2 2}, and target = 0.
# 
# A solution set is:
# (-1,  0, 0, 1)
# (-2, -1, 1, 2)
# (-2,  0, 0, 2)

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
  results = []
  h = {}
  nums.map! do |num|
    num - target / 4.0
  end

  nums.each do |e|
    if e < 0
      h[-e] = [0,0] if h[-e].nil?
      h[-e][0] += 1
    else
      h[e] = [0,0] if h[e].nil?
      h[e][1] += 1
    end
  end


  h.select! do |k, v|
    if k == 0
      v.max > 0
    else
      v.min > 0
    end
  end

  values = h.keys.sort

  (values.length).times do |i|
    start = nil
    if values[i] == 0
      if h[values[i]].max / 2 >= 2
        start = i
      else
        start = i + 1
      end
    else
      if h[values[i]].min >= 2
        start = i
      else
        start = i + 1
      end
    end
    (start...values.length).each do |j|
      results << [
        (-values[j] + target / 4.0).to_i,
        (-values[i] + target / 4.0).to_i,
        (values[i] + target / 4.0).to_i,
        (values[j] + target / 4.0).to_i
      ]
    end
  end

  results
end
