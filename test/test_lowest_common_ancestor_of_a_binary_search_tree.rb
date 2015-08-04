require 'minitest/autorun'
require '../lowest_common_ancestor_of_a_binary_search_tree'

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

describe 'lowest_common_ancestor(root, p, q)' do
  it 'should work' do
    n6 = TreeNode.new 6
    n2 = TreeNode.new 2
    n8 = TreeNode.new 8
    n0 = TreeNode.new 0
    n4 = TreeNode.new 4
    n7 = TreeNode.new 7
    n9 = TreeNode.new 9
    n3 = TreeNode.new 3
    n5 = TreeNode.new 5

    n6.left = n2
    n6.right = n8
    n2.left = n0
    n2.right = n4
    n8.left = n7
    n8.right = n9
    n4.left = n3
    n4.right = n5
    lowest_common_ancestor(n6, n2, n8).must_equal(n6)
    lowest_common_ancestor(n6, n6, n8).must_equal(n6)
    lowest_common_ancestor(n6, n4, n2).must_equal(n2)
    lowest_common_ancestor(n6, n2, n4).must_equal(n2)

  end

  it 'should work 2' do
    n2 = TreeNode.new 2
    n1 = TreeNode.new 1
    n2.left = n1
    lowest_common_ancestor(n2, n2, n1).must_equal(n2)
  end

  it 'should work 3' do
    n6 = TreeNode.new 6
    n2 = TreeNode.new 2
    n8 = TreeNode.new 8
    n0 = TreeNode.new 0
    n4 = TreeNode.new 4
    n7 = TreeNode.new 7
    n9 = TreeNode.new 9
    n3 = TreeNode.new 3
    n5 = TreeNode.new 5

    n6.left = n2
    n6.right = n8
    n2.left = n0
    n2.right = n4
    n8.left = n7
    n8.right = n9
    n4.left = n3
    n4.right = n5
    lowest_common_ancestor(n6, n3, n5).must_equal(n4)
  end
end

