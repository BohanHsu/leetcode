require 'minitest/autorun'
require '../validate_binary_search_tree'

def binary_tree_to_str(root)
  node_num = { root => 1 }
  queue = [root]
  max = -1

  while !queue.empty? do
    node = queue.shift
    max = node_num[node]
    if node.left
      node_num[node.left] = node_num[node] * 2
      queue << node.left
    end

    if node.right
      node_num[node.right] = node_num[node] * 2 + 1
      queue << node.right
    end
  end

  arr = max.times.map { "#" }
  node_num.each do |k, v|
    arr[v-1] = k.val
  end

  arr.join("")
end

def str_to_binary_tree(str)
  arr = str.split("").map do |e|
    if e == "#"
      e
    else
      e.to_i
    end
  end
  arr.each_with_index do |val, i|
    if val != "#"
      tn = TreeNode.new val
      if i != 0
        if (i + 1).even?
          arr[(i+1)/2-1].left = tn
        else
          arr[(i+1)/2-1].right = tn
        end
      end
      arr[i] = tn
    end
  end
  arr[0]
end

describe 'binary_tree_to_str(root)' do
  it 'should convert tree to array' do
    t8 = TreeNode.new 8
    t7 = TreeNode.new 7
    t3 = TreeNode.new 3
    t5 = TreeNode.new 5
    t4 = TreeNode.new 4
    t6 = TreeNode.new 6
    t9 = TreeNode.new 9
    t8.left = t7
    t8.right = t9
    t7.left = t3
    t3.right = t5
    t5.left = t4
    t5.right = t6

    binary_tree_to_str(t8).must_equal("8793####5########46")
  end
end

describe 'str_to_binary_tree(arr)' do
  it 'should convert arr to tree' do
    str = "8793####5########46"
    binary_tree_to_str(str_to_binary_tree(str)).must_equal(str)
  end
end

describe 'is_valid_bst(root)' do
  it 'should work1' do
    str = "8793####5########46"
    root = str_to_binary_tree(str)
    is_valid_bst(root).must_equal(true)
  end

  it 'should work2' do
    str = "8793####5########40"
    root = str_to_binary_tree(str)
    is_valid_bst(root).must_equal(false)
  end
end
