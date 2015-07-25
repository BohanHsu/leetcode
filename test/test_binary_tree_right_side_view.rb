require 'minitest/autorun'
require '../binary_tree_right_side_view'

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

describe 'right_side_view(root)' do
  it 'should work' do
    n1 = TreeNode.new 1
    n2 = TreeNode.new 2
    n3 = TreeNode.new 3
    n4 = TreeNode.new 4
    n5 = TreeNode.new 5

    n1.left = n2
    n1.right = n3
    n2.right = n5
    n3.right = n4

    right_side_view(n1).must_equal([1,3,4])
  end

  it 'should work on corner case' do
    right_side_view(nil).must_equal([])
  end
end
