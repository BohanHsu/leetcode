# Given a binary tree, imagine yourself standing on the right side of it, 
# return the values of the nodes you can see ordered from top to bottom.

# For example:
# Given the following binary tree,
#    1            <---
#   /   \
#   2     3         <---
#    \     \
#      5     4       <---
# You should return [1, 3, 4].

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def right_side_view(root)
  results = []
  return results if root.nil?
  depth = {}
  queue = [root]
  depth[root] = 0

  while !queue.empty? do
    node = queue.shift
    if !node.left.nil?
      queue << node.left
      depth[node.left] = depth[node] + 1
    end
    if !node.right.nil?
      queue << node.right
      depth[node.right] = depth[node] + 1
    end

    if queue.empty? || depth[node] + 1 == depth[queue.first]
      results << node.val
    end
  end

  results
end
