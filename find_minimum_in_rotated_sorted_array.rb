# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  from = 0
  to = nums.length - 1

  return nums[0] if to == 0

  while true do
    if (to - from) == 1
      return nums[from] < nums[to] ? nums[from] : nums[to]
    end

    if (to - from) % 2 == 0
      i = from + (to - from) / 2
      if !sorted?(nums, from, i)
        to = i
      elsif !sorted?(nums, i, to)
        from = i
      elsif sorted?(nums, from, i) && sorted?(nums, i, to)
        return nums[from]
      end
    else
      i1 = from + (to - from - 1) / 2
      i2 = from + (to - from + 1) / 2

      if !sorted?(nums, from, i1)
        to = i1
      elsif !sorted?(nums, i2, to)
        from = i2
      elsif sorted?(nums, from, i1) && sorted?(nums, i2, to)
        return nums[from] < nums[i2] ? nums[from] : nums[i2]
      end
    end
  end
end

def sorted?(nums, from, to)
  return nums[from] < nums[to]
end
