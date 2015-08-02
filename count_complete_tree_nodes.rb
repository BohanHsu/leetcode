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
  depth_left = 1
  depth_right = 1

  n = root
  while n.left do
    depth_left += 1
    n = n.left
  end

  while n.right do
    depth_right += 1
    n = n.right
  end

  if depth_left == depth_right
    return 2 ** depth_left - 1
  else
    return count_nodes(root.left) + count_nodes(root.right) + 1
  end
end
