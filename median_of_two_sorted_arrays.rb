# There are two sorted arrays nums1 and nums2 of size m and n respectively. 
# Find the median of the two sorted arrays. The overall run time complexity 
# should be O(log (m+n)).

# [1,3,5,7]
# [2,8,14]
# i == 2 -> j = 0
#
# [1,3,5,7]
# [2,8,14,20]
# i == 2 -> j == 1

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  if nums1.empty?
    if nums2.length.even?
      return (nums2[nums2.length / 2] + nums2[nums2.length / 2 - 1]) / 2.0
    else
      return nums2[nums2.length / 2]
    end
  end

  if nums2.empty?
    if nums1.length.even?
      return (nums1[nums1.length / 2] + nums1[nums1.length / 2 - 1]) / 2.0
    else
      return nums1[nums1.length / 2]
    end
  end

  n1 = nums2
  n2 = nums1

  2.times do 
    tmp = n1
    n1 = n2
    n2 = tmp

    from = 0
    to = n1.length - 1

    while to >= from do
      i = (from + to) / 2

      if (nums1.length + nums2.length).odd?
        half = (nums1.length + nums2.length) / 2
        j = half - i - 1
        #p "n1=#{n1}, i=#{i}, j=#{j}"
        if j < -1
          to = i - 1
        elsif j > n2.length - 1
          from = i + 1
        elsif j == -1
          if n1[i] <= n2[j+1]
            return n1[i]
          else
            to = i - 1
          end
        elsif j == n2.length - 1
          if n2[j] <= n1[i]
            return n1[i]
          else
            from = i + 1
          end
        elsif n2[j] <= n1[i] && n1[i] <= n2[j+1]
          return n1[i]
        elsif n2[j] > n1[i]
          from = i + 1
        elsif n1[i] > n2[j+1]
          to = i - 1
        end
      else
        half = (nums1.length + nums2.length) / 2
        j = half - i - 1
        #p "n1=#{n1}, i=#{i}, j=#{j}"
        if j < -1
          to = i - 1
        elsif j > n2.length - 1
          from = i + 1
        elsif j == -1
          if n1[i] <= n2[j+1]
            return (n1[i] + n1[i-1]) / 2.0
          else
            to = i - 1
          end
        elsif j == n2.length - 1
          if n2[j] <= n1[i]
            maximum = nil
            if i != 0
              maximum = n1[i-1] > n2[j] ? n1[i-1] : n2[j]
            else
              maximum = n2[j]
            end
            return (n1[i] + maximum) / 2.0
          else
            from = i + 1
          end
        elsif n2[j] <= n1[i] && n1[i] <= n2[j+1]
          maximum = nil
          if i != 0
            maximum = n1[i-1] > n2[j] ? n1[i-1] : n2[j]
          else
            maximum = n2[j]
          end
          return (n1[i] + maximum) / 2.0
        elsif n2[j] > n1[i]
          from = i + 1
        elsif n1[i] > n2[j+1]
          to = i - 1
        end
      end
    end
  end
  nil
end
