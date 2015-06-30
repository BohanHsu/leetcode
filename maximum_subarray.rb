# Find the contiguous subarray within an array (containing at least one number)
# which has the largest sum.

# For example, given the array [−2,1,−3,4,−1,2,1,−5,4],
# the contiguous subarray [4,−1,2,1] has the largest sum = 6.

# click to show more practice.

# More practice:
# If you have figured out the O(n) solution, try coding another solution using
# the divide and conquer approach, which is more subtle.

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  max_so_far = nums.first
  max_value = nums.first

  nums[1...nums.length].each do |e|
    max_value += e
    max_value = e if max_value < e
    max_so_far = max_value if max_value > max_so_far
  end
  max_so_far
end
