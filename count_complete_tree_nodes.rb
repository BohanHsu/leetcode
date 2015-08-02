# Given a complete binary tree, count the number of nodes.

# Definition of a complete binary tree from Wikipedia:
# In a complete binary tree every level, except possibly the last, is completely
# filled, and all nodes in the last level are as far left as possible. It can 
# have between 1 and 2h nodes inclusive at the last level h.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def count_nodes(root)
  return 0 if root.nil?
  stack = []

  count = 0

  stack << root

  n = stack.last
  while n.left do
    stack << n.left
    n = stack.last
  end

  depth = stack.size

  while stack.size == depth do
    count += 1

    n = stack.pop

    while !stack.empty? && n == stack.last.right do
      n = stack.pop
    end

    break if stack.empty?

    if stack.last.right
      stack << stack.last.right

      n = stack.last

      while n.left do
        stack << n.left
        n = stack.last
      end
    end
  end

  sum = 0
  2 ** (depth - 1) + count - 1
end
