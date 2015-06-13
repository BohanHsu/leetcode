# Follow up for "Remove Duplicates":
# What if duplicates are allowed at most twice?
# For example,
# Given sorted array nums = [1,1,1,2,2,3],

# Your function should return length = 5, with the first five elements of nums 
# being 1, 1, 2, 2 and 3. It doesn't matter what you leave beyond the new 
# length.

# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  prev1 = nil
  prev2 = nil

  i = 0
  nums.length.times do |c|
    if nums[i] == prev2 and nums[i] == prev1
      nums.delete_at i
    else
      prev2 = prev1
      prev1 = nums[i]
      i += 1
    end
  end
  i
end
