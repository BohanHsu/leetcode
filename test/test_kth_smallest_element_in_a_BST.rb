require 'minitest/autorun'
require '../kth_smallest_element_in_a_BST'

# definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

describe 'kth_smallest(root, k)' do
  it 'should help' do
    t0 = TreeNode.new 8
    t1 = TreeNode.new 7
    t2 = TreeNode.new 9
    t3 = TreeNode.new 3
    t4 = TreeNode.new 5
    t5 = TreeNode.new 4
    t6 = TreeNode.new 6

    t0.left = t1
    t0.right = t2
    t1.left = t3
    t3.right = t4
    t4.left = t5
    t4.right = t6

    kth_smallest(t0, 3).must_equal(5)

  end
end
