# Given an integer array of size n, find all elements that appear more than 
# ⌊ n/3 ⌋ times. The algorithm should run in linear time and in O(1) space.

# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
  n1 = nil
  n2 = nil
  c1 = 0
  c2 = 0

  nums.each do |e|
    if e == n1
      c1 += 1
    elsif e == n2
      c2 += 1
    elsif c1 == 0
      n1 = e
      c1 = 1
    elsif c2 == 0
      n2 = e
      c2 = 1
    elsif e != n1 && e != n2
      c1 -= 1
      c2 -= 1
    end
  end

  c1 = 0
  c2 = 0
  nums.each do |e|
    c1 += 1 if e == n1
    c2 += 1 if e == n2
  end

  res = []
  res << n1 if c1 > nums.length / 3
  res << n2 if c2 > nums.length / 3
  res.sort
end
