# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  min = nil
  stack = []

  from = 0
  to = nums.length - 1

  stack.push([from, to])

  return nums[0] if to == 0

  while !stack.empty? do
    pair = stack.pop
    from = pair[0]
    to = pair[1]
    if (to - from) == 1
      local_min = nums[from] < nums[to] ? nums[from] : nums[to]
      if min.nil?
        min = local_min
      else
        min = local_min < min ? local_min : min
      end
    else

      if (to - from) % 2 == 0
        i = from + (to - from) / 2

        if !sorted?(nums, from, i)
          stack.push([from, i])
        else
          local_min = nums[from]
          if min.nil?
            min = local_min
          else
            min = local_min < min ? local_min : min
          end
        end

        if !sorted?(nums, i, to)
          stack.push([i, to])
        else
          local_min = nums[i]
          if min.nil?
            min = local_min
          else
            min = local_min < min ? local_min : min
          end
        end
      else
        i1 = from + (to - from - 1) / 2
        i2 = from + (to - from + 1) / 2

        if !sorted?(nums, from, i1)
          stack.push([from, i1])
        else
          local_min = nums[from]
          if min.nil?
            min = local_min
          else
            min = local_min < min ? local_min : min
          end
        end

        if !sorted?(nums, i2, to)
          stack.push([i2, to])
        else
          local_min = nums[i2]
          if min.nil?
            min = local_min
          else
            min = local_min < min ? local_min : min
          end
        end
      end
    end
  end
  
  min
end

def sorted?(nums, from, to)
  return nums[from] < nums[to]
end
