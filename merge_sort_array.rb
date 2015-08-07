# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  k = m + n - 1
  i = m - 1
  j = n - 1

  while k >= 0 do
    if i >= 0 && j >=0
      if nums1[i] >= nums2[j]
        swap(nums1, i, k)
        k -= 1
        i -= 1
      else
        nums1[k] = nums2[j]
        k -= 1
        j -= 1
      end
    elsif i >= 0 && j < 0
      swap(nums1, i, k)
      k -= 1
      i -= 1
    elsif i < 0 && j >= 0
      nums1[k] = nums2[k]
      k -= 1
      j -= 1
    end
  end

  nil
end

def swap(arr, i, j)
  tmp = arr[i]
  arr[i] = arr[j]
  arr[j] = tmp
end
