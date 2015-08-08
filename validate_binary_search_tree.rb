# Given a binary tree, determine if it is a valid binary search tree (BST).

# Assume a BST is defined as follows:

# The left subtree of a node contains only nodes with keys less than the node's key.
# The right subtree of a node contains only nodes with keys greater than the node's key.
# Both the left and right subtrees must also be binary search trees.

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  return false if root.nil?
  min_hash = {}
  max_hash = {}

  stack = [root]

  while !stack.empty? do
    node = stack.pop
    return false if min_hash[node] && node.val <= min_hash[node]
    return false if max_hash[node] && node.val >= max_hash[node]

    if node.left
      stack << node.left
      min_hash[node.left] = min_hash[node]
      max_hash[node.left] = node.val
    end

    if node.right
      stack << node.right
      min_hash[node.right] = node.val
      max_hash[node.right] = max_hash[node]
    end
  end

  true
end
