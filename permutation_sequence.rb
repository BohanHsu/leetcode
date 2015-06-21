# The set [1,2,3,…,n] contains a total of n! unique permutations.
# 
# By listing and labeling all of the permutations in order,
# We get the following sequence (ie, for n = 3):
# 
# "123"
# "132"
# "213"
# "231"
# "312"
# "321"
# Given n and k, return the kth permutation sequence.
# 
# Note: Given n will be between 1 and 9 inclusive.

# "1234"
# "1243"
# "1324"
# "1342"
# "1423"
# "1432"

# @param {Integer} n
# @param {Integer} k
# @return {String}
def get_permutation(n, k)
  remains = (1..n).map do |i|
    i
  end

  result = []

  h = {0 => 1}
  (n-1).times do |i|
    h[i+1] = (i+1) * h[i]
  end
  h.delete 0

  if n == 2
    k = k % n
  end

  while n > 2 do
    i = (k-1) / h[n - 1]
    result << remains[i]
    remains.delete_at i
    k = k % h[n-1]
    n -= 1
  end

  if remains.length > 1
    if k == 1
      result << remains.first
      result << remains.last
    elsif k == 0
      result << remains.last
      result << remains.first
    end
  else
    result << remains.first
  end

  result.join ""
end
