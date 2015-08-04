# Given a binary search tree (BST), find the lowest common ancestor (LCA) of two
# given nodes in the BST.

# According to the definition of LCA on Wikipedia: “The lowest common ancestor 
# is defined between two nodes v and w as the lowest node in T that has both 
# v and w as descendants (where we allow a node to be a descendant of itself).”

# Definition for a binary tree node.
# # class TreeNode
# #     attr_accessor :val, :left, :right
# #     def initialize(val)
# #         @val = val
# #         @left, @right = nil, nil
# #     end
# # end
#
# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  p = p.val
  q = q.val

  n = root

  while !(n.val == p || n.val == q) do
    return n if n.val < p && n.val > q || n.val < q && n.val > p
    if n.val < p && n.val < q
      n = n.right
    elsif n.val > p && n.val > q
      n = n.left 
    end
  end

  n
end
