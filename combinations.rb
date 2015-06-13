# Given two integers n and k, return all possible combinations of k numbers 
# out of 1 ... n.
# For example,
# If n = 4 and k = 2, a solution is:
#
# [
#   [2,4],
#   [3,4],
#   [2,3],
#   [1,2],
#   [1,3],
#   [1,4],
# ]

# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
  if k == 1
    return n.times.map do |i|
      [i + 1]
    end
  else
    results = []
    ((k-n)..n).each do |last_element|
      results += combine(last_element-1, k-1).map do |elem|
        elem += [last_element]
      end
    end
  end
  results
end
