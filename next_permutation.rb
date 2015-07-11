# Implement next permutation, which rearranges numbers into the 
# lexicographically next greater permutation of numbers.
#
# If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
# The replacement must be in-place, do not allocate extra memory.

# Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
# 1,2,3 → 1,3,2
# 3,2,1 → 1,2,3
# 1,1,5 → 1,5,1

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
  (nums.length - 1).times do |j|
    i = nums.length - 1 - j
    if nums[i] > nums[i - 1]
      min = Float::INFINITY
      swap_index = nil
      (i...nums.length).each do |k|
        if nums[k] < min && nums[k] > nums[i-1]
          min = nums[k] 
          swap_index = k
        end
      end
      tmp = nums[i-1]
      nums[i-1] = nums[swap_index]
      nums[swap_index] = tmp

      quick_sort!(nums, i, nums.length)
      return
    end
  end
  quick_sort!(nums, 0, nums.length)
end

def quick_sort!(nums, from, to)
  return if to - from == 1

  pivot_index = from
  pivot = nums[pivot_index]
  nums[pivot_index] = nums[from]
  nums[from] = pivot

  j = nil
  ((from + 1)...to).each do |i|
    if nums[i] >= pivot
      j = i if j.nil?
    else
      unless j.nil?
        tmp = nums[i]
        nums[i] = nums[j]
        nums[j] = tmp
        j += 1
      end
    end
  end

  j = to if j.nil?
  pivot_index = j - 1
  nums[from] = nums[pivot_index]
  nums[pivot_index] = pivot
  quick_sort!(nums, from, pivot_index) if pivot_index - from > 0
  quick_sort!(nums, pivot_index + 1, to) if to - pivot_index - 1 > 0
end
