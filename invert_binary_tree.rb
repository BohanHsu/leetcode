# Invert a binary tree.

#        4
#      /   \
#     2     7
#    / \   / \
#   1   3 6   9
# to
#        4
#      /   \
#     7     2
#    / \   / \
#   9   6 3   1
# Trivia:
#   This problem was inspired by this original tweet by Max Howell:
#   Google: 90% of our engineers use the software you wrote (Homebrew), but 
#   you can’t invert a binary tree on a whiteboard so fuck off.

# Definition for a binary tree node.
# # class TreeNode
# #     attr_accessor :val, :left, :right
# #     def initialize(val)
# #         @val = val
# #         @left, @right = nil, nil
# #     end
# # end
#
# # @param {TreeNode} root
# @return {TreeNode}
def invert_tree(root)
  return nil if root.nil?

  stack = [root]

  while !stack.empty? do
    n = stack.pop
    tmp = n.left
    n.left = n.right
    n.right = tmp

    stack << n.left if !n.left.nil?
    stack << n.right if !n.right.nil?
  end

  root
end
