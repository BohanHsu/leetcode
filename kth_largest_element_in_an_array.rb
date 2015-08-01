# Find the kth largest element in an unsorted array. Note that it is the kth 
# largest element in the sorted order, not the kth distinct element.

# For example,
# Given [3,2,1,5,6,4] and k = 2, return 5.

# Note: 
# You may assume k is always valid, 1 ≤ k ≤ array's length.

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  pivot = quick_sort(nums, 0, nums.length - 1)
  #p "nums=#{nums}, k=#{k}, pivot=#{pivot}"

  if pivot == k - 1
    return nums[pivot]
  elsif pivot < k - 1
    return find_kth_largest(nums[pivot+1...nums.length], k-pivot-1)
  elsif pivot > k - 1
    return find_kth_largest(nums[0...pivot], k)
  end

  nil

end

def quick_sort(nums, from, to)
  pivot_index = rand(to - from + 1) + from
  swap(nums, pivot_index, to)

  i = from
  j = from
  while i < to do
    if nums[i] > nums[-1]
      swap(nums, i, j)
      j += 1
    end
    i += 1
  end

  swap(nums, j, to)
  j
end

def swap(nums, a, b)
  tmp = nums[a]
  nums[a] = nums[b]
  nums[b] = tmp
end
