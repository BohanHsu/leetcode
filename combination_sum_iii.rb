# Find all possible combinations of k numbers that add up to a number n, given
# that only numbers from 1 to 9 can be used and each combination should be a
# unique set of numbers.

# Ensure that numbers within the set are sorted in ascending order.
# Example 1:

# Input: k = 3, n = 7
# Output:
# [[1,2,4]]

# Example 2:
# Input: k = 3, n = 9
# Output:
# [[1,2,6], [1,3,5], [2,3,4]]


class Node
  attr_accessor :val, :parent, :level, :cur_val
  def initialize(val, level, cur_val)
    @val = val
    @cur_val = cur_val
    @level = level
    @parent = nil
    #@children = []
  end
end

# @param {Integer} k
# @param {Integer} n
# @return {Integer[][]}
def combination_sum3(k, n)
  results = []
  root = Node.new 0, 0, 0

  queue = [root]

  while !queue.empty? do
    node = queue.shift
    #p "node.val=#{node.val}, node.cur_val=#{node.cur_val} node.level=#{node.level}"
    if node.level == k && node.val == n
      #p :hehe
      result = k.times.map { nil }
      i = 0
      while i < k do
        result[k - 1 - i] = node.cur_val
        node = node.parent
        i += 1
      end
      results << result
    elsif node.level < k && node.val < n
      upper_bound = n - node.val
      upper_bound = 9 if upper_bound > 9
      #p "(#{node.cur_val+1}..#{upper_bound}) = #{((node.cur_val + 1)..upper_bound)}"
      ((node.cur_val + 1)..upper_bound).each do |i|
        new_node = Node.new(node.val + i, node.level + 1, i)
        #p "    new_node.val=#{new_node.val}, new_node.cur_val=#{new_node.cur_val} new_node.level=#{new_node.level}"
        new_node.parent = node
        queue << new_node
      end
    end
  end
  results
end
