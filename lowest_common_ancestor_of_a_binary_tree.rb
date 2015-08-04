# Given a binary tree, find the lowest common ancestor (LCA) of two given nodes 
# in the tree.

# According to the definition of LCA on Wikipedia: “The lowest common ancestor 
# is defined between two nodes v and w as the lowest node in T that has both v 
# and w as descendants (where we allow a node to be a descendant of itself).”

# Definition for a binary tree node.
# # class TreeNode
# #     attr_accessor :val, :left, :right
# #     def initialize(val)
# #         @val = val
# #         @left, @right = nil, nil
# #     end
# # end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  parent = {}
  stack = [root]

  while (p != root && parent[p].nil?) || (q != root && parent[q].nil?) do
    n = stack.pop
    if n.left
      parent[n.left] = n
      stack << n.left
    end

    if n.right
      parent[n.right] = n
      stack << n.right
    end
  end

  path1, path2 = [], []

  n = p
  while n do
    path1 << n
    n = parent[n]
  end

  n = q
  while n do
    path2 << n
    n = parent[n]
  end

  path1.reverse!
  path2.reverse!
  
  #p "path1 = #{path1.map {|n| n.val}}"
  #p "path2 = #{path2.map {|n| n.val}}"

  len = [path1.length, path2.length].min
  i = 0
  while i < len do
    if i < len - 1
      return path1[i] if path1[i+1] != path2[i+1]
    elsif i == len - 1
      return path1[i]
    end
    i += 1
  end
  nil
end
