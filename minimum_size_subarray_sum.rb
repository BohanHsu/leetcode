# Given an array of n positive integers and a positive integer s, find the 
# minimal length of a subarray of which the sum ≥ s. If there isn't one, 
# return 0 instead.

# For example, given the array [2,3,1,2,4,3] and s = 7,
# the subarray [4,3] has the minimal length under the problem constraint.

# @param {Integer} s
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(s, nums)
  return 0 if nums.empty?
  from, to = 0, 1
  sum = nums.first
  min_len = nums.length + 1

  while from < to && from < nums.length do
    if sum < s
      if to < nums.length
        sum += nums[to]
        to += 1
      else
        break
      end
    elsif sum >= s
      cur_min_len = to - from
      min_len = cur_min_len if cur_min_len < min_len
      sum -= nums[from]
      from += 1
    #elsif sum > s
    #  sum -= nums[from]
    #  from += 1
    end
  end
  min_len > nums.length ? 0 : min_len
end
