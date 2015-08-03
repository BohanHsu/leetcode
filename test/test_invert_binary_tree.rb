require 'minitest/autorun'
require '../invert_binary_tree'

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

describe 'invert_tree(root)' do
  it 'should work' do
    n1 = TreeNode.new 4
    n2 = TreeNode.new 2
    n3 = TreeNode.new 7
    n4 = TreeNode.new 1
    n5 = TreeNode.new 3
    n6 = TreeNode.new 6
    n7 = TreeNode.new 9
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    n3.left = n6
    n3.right = n7
    
    m1 = invert_tree(n1)

    m1.val.must_equal(4)
    m2 = m1.left
    m3 = m1.right
    m2.val.must_equal(7)
    m3.val.must_equal(2)
    m4 = m2.left
    m5 = m2.right
    m4.val.must_equal(9)
    m5.val.must_equal(6)
    m6 = m3.left
    m7 = m3.right
    m6.val.must_equal(3)
    m7.val.must_equal(1)
  end
end

