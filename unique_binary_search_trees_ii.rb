# Given n, generate all structurally unique BST's (binary search trees) that store values 1...n.
# For example,
# Given n = 3, your program should return all 5 unique BST's shown below.

#  1         3     3      2      1
#   \       /     /      / \      \
#    3     2     1      1   3      2
#   /     /       \                 \
#  2     1         2                 3

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# # @param {Integer} n
# @return {TreeNode[]}
def generate_trees(n)
  left_tree = TreeNode.new -1
  tn = TreeNode.new -1
  left_tree.left = tn
  right_tree = TreeNode.new -1
  tn = TreeNode.new -1
  right_tree.right = tn
  structure = {
    0 => [nil],
    1 => [TreeNode.new(-1)],
    2 => [left_tree, right_tree]
  }

  (3..n).each do |i|
    structure[i] = []
    (1..i).each do |j|
      left_num = j - 1
      right_num = i - j
      structure[left_num].each do |left_root|
        structure[right_num].each do |right_root|
          new_root_of_i_node = TreeNode.new -1
          new_root_of_i_node.left = copy_tree_struct(left_root)
          new_root_of_i_node.right = copy_tree_struct(right_root)
          structure[i] << new_root_of_i_node
        end
      end
    end
  end

  structure[n].each do |root|
    in_order_traverse_set_val(root)
  end

  structure[n]
end

def in_order_traverse_set_val(root)
  stack = []
  n = root
  i = 0

  while !stack.empty? || !n.nil? do
    if n
      stack << n
      n = n.left
    else
      m = stack.pop
      m.val = (i+=1)
      n = m.right
    end
  end
end

def copy_tree_struct(root)
  return nil if root.nil?
  new_root = TreeNode.new -1

  queue1 = [root]
  queue2 = [new_root]
  while !queue1.empty? do
    node1 = queue1.shift
    node2 = queue2.shift

    if node1.left
      nl = TreeNode.new -1
      node2.left = nl
      queue1 << node1.left
      queue2 << node2.left
    end

    if node1.right
      nr = TreeNode.new -1
      node2.right = nr
      queue1 << node1.right
      queue2 << node2.right
    end
  end

  new_root
end
