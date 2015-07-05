# Given an unsorted integer array, find the first missing positive integer.
# For example,
# Given [1,2,0] return 3,
# and [3,4,-1,1] return 2.
# Your algorithm should run in O(n) time and uses constant space.

# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
  nums.length.times do |i|
    if nums[i].nil? || nums[i] <= 0 || nums[i] > nums.length
      nums[i] = nil
    elsif nums[i] != i + 1

      j = i
      prev = nil
      while nums[j] != j + 1 do
        unless nums[j].nil?
          new_j = nums[j] - 1
          tmp = nums[new_j]
          nums[new_j] = new_j + 1
        end

        nums[j] = prev

        if tmp.nil? || tmp <= 0 || tmp > nums.length
          j = new_j
        else
          prev = tmp
          j = tmp - 1
        end
      end
    end
  end

  nums.each_with_index do |e, i|
    return i + 1 if e.nil?
  end
  nums.length + 1
end
