require 'minitest/autorun'
require '../lowest_common_ancestor_of_a_binary_tree'

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

describe 'lowest_common_ancestor(root, p, q)' do
  it 'should work' do
    n3 = TreeNode.new 3
    n5 = TreeNode.new 5
    n1 = TreeNode.new 1
    n6 = TreeNode.new 6
    n2 = TreeNode.new 2
    n0 = TreeNode.new 0
    n8 = TreeNode.new 8
    n7 = TreeNode.new 7
    n4 = TreeNode.new 4

    n3.left = n5
    n3.right = n1
    n5.left = n6
    n5.right = n2
    n1.left = n0
    n1.right = n8
    n2.left = n7
    n2.right = n4

    lowest_common_ancestor(n3, n5, n1).must_equal(n3)
    lowest_common_ancestor(n3, n5, n4).must_equal(n5)
  end

  it 'should work 1' do
    n1 = TreeNode.new 1
    n2 = TreeNode.new 2
    n1.left = n2
    lowest_common_ancestor(n1, n1, n2).must_equal(n1)
  end
end
