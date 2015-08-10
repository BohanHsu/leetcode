# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def recover_tree(root)
  return if root.nil?

  stack = []

  prev = TreeNode.new(-Float::INFINITY)
  n = root
  damn_node = nil

  swap_nodes = []

  while !n.nil? || !stack.empty? do
    if n.nil?
      n = stack.pop

      if !prev.nil?
        if n.val < prev.val
          if swap_nodes.empty?
            swap_nodes << prev
            damn_node = n
          else
            swap_nodes << n
          end
        end
      end

      prev = n

      n = n.right
    else
      while !n.nil? do
        stack << n
        n = n.left
      end
    end
  end

  if swap_nodes.length < 2
    if !damn_node.nil?
      swap_nodes << damn_node
    elsif swap_nodes[0] == root
      if root.left && root.left.val > root.val
        swap_nodes << root.left
      elsif root.right && root.right.val < root.val
        swap_nodes << root.right
      end
    else
      swap_nodes << root
    end
  end


  tmp = swap_nodes[0].val
  swap_nodes[0].val = swap_nodes[1].val
  swap_nodes[1].val = tmp
  nil
end
