# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  find_peak_element_in_range(nums, 0, nums.length)
end

# @param {Integer[]} nums
# @param {Integer} from
# @param {Integer} to
def find_peak_element_in_range(nums, from, to)
  mid = (from + to) / 2
  len = nums.length
  return 0 if to - from == 1
  return mid if peek?(nums, mid)
  return find_peak_element_in_range(nums, from, mid) if mid != 0 && nums[mid-1] > nums[mid]
  return find_peak_element_in_range(nums, mid, to) if mid != len-1 && nums[mid+1] > nums[mid]
end

def peek?(nums, index)
  len = nums.length
  return nums[0] > nums[1] if index == 0
  return nums[len-2] < nums[len-1] if index == len - 1
  return nums[index-1] < nums[index] && nums[index] > nums[index+1]
end
