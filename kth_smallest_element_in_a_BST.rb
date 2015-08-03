# Given a binary search tree, write a function kthSmallest to find the kth 
# smallest element in it.

# Note: 
# You may assume k is always valid, 1 ≤ k ≤ BST's total elements.

# Follow up:
# What if the BST is modified (insert/delete operations) often and you need to 
# find the kth smallest frequently? How would you optimize the kthSmallest 
# routine?

# definition for a binary tree node.
# # class treenode
# #     attr_accessor :val, :left, :right
# #     def initialize(val)
# #         @val = val
# #         @left, @right = nil, nil
# #     end
# # end

# @param {TreeNode} root
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
  return nil if root.nil?
  count = 0

  stack = []
  n = root

  while !stack.empty? || !n.nil? do
    while n do
      stack << n
      n = n.left
    end

    m = stack.pop

    count += 1
    return m.val if count == k

    n = m.right
  end
  nil
end
