# Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND 
# of all numbers in this range, inclusive.
#
# For example, given the range [5, 7], you should return 4.

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def range_bitwise_and(m, n)

  base = 0
  while m != n do
    m /= 2
    n /= 2
    base += 1
  end

  m * (2 ** base)
end
