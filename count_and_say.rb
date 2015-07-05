# The count-and-say sequence is the sequence of integers beginning as follows:
# 1, 11, 21, 1211, 111221, ...

# 1 is read off as "one 1" or 11.
# 11 is read off as "two 1s" or 21.
# 21 is read off as "one 2, then one 1" or 1211.
# Given an integer n, generate the nth sequence.

# Note: The sequence of integers will be represented as a string.

# @param {Integer} n
# @return {String}
def count_and_say(n)
  res = [1]
  return res.join "" if n == 1
  (n - 1).times do ||
    res = next_num(res)
  end
  res.join ""
end

def next_num(a)
  cur = a.first
  count = 0
  res = []
  a.length.times do |i|
    if a[i] == cur
      count += 1
    else
      res << count << cur
      cur = a[i]
      count = 1
    end
  end
  res << count << cur
end
