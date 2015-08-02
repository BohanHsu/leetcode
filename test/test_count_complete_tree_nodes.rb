require 'minitest/autorun'
require '../count_complete_tree_nodes'

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

describe 'count_nodes(root)' do
  it 'should work 1' do
    n1 = TreeNode.new 1
    count_nodes(n1).must_equal(1)
  end

  it 'should work 2' do
    n1 = TreeNode.new 1
    n2 = TreeNode.new 2
    n3 = TreeNode.new 3
    n1.left = n2
    n1.right = n3
    count_nodes(n1).must_equal(3)
  end

  it 'should work 3' do
    n1 = TreeNode.new 1
    n2 = TreeNode.new 2
    n3 = TreeNode.new 3
    n4 = TreeNode.new 4
    n1.left = n2
    n1.right = n3
    n2.left = n4
    count_nodes(n1).must_equal(4)
  end
end
