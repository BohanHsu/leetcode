# Suppose a sorted array is rotated at some pivot unknown to you beforehand.
# 
# (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
# 
# You are given a target value to search. If found in the array return its 
# index, otherwise return -1.
# 
# You may assume no duplicate exists in the array.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  from = 0
  to = nums.length - 1
  i = (from + to) / 2
  stack = []

  stack.push [from, i]
  stack.push [i, to]

  while !stack.empty? do
    from = stack.last[0]
    to = stack.pop[1]

    if from == to
      if target == nums[from] && !stack.empty?
        return from
      elsif target != nums[from] && stack.empty?
        return -1
      else
        next
      end
    end

    if from == to - 1
      if target == nums[from]
        return from
      elsif target == nums[to]
        return to
      elsif stack.empty?
        return -1
      elsif !stack.empty?
        next
      end
    end

    if sorted?(nums, from, to) 
      if (nums[from] > target || nums[to] < target)
        next
      else
        i = (from + to) / 2
        if target == nums[i]
          return i
        elsif target < nums[i]
          stack.push [from, i]
        else
          stack.push [i, to]
        end
      end
    else
      i = (from + to) / 2
      stack.push [from, i]
      stack.push [i, to]
    end
  end
  -1
end

def sorted?(nums, from, to)
  return nums[from] < nums[to]
end
