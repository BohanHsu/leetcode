require 'minitest/autorun'
require '../reverse_nodes_in_k-group'

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def array_to_list(array)
  head = ListNode.new array.first
  n = head
  (1...array.length).each do |i|
    n.next = ListNode.new array[i]
    n = n.next
  end
  head
end

def list_to_array(list)
  [].tap do |array|
    until list.nil? do
      array << list.val
      list = list.next
    end
  end
end

describe 'array_to_list(array)' do
  it 'should work' do
    a = [1,2,3]
    head = array_to_list a
    head.val.must_equal(1)
    head = head.next
    head.val.must_equal(2)
    head = head.next
    head.val.must_equal(3)
    head = head.next
    head.must_equal(nil)
  end
end

describe 'list_to_array(list)' do
  it 'should work' do
    n1 = ListNode.new 1
    n2 = ListNode.new 2
    n3 = ListNode.new 3
    n1.next = n2
    n2.next = n3
    list_to_array(n1).must_equal([1,2,3])
  end
end

describe 'reverse_k_group(head, k)' do
  it 'should work' do
    arr = [1,2,3,4,5,6,7,8]
    expected_result = [3,2,1,6,5,4,7,8]
    list_to_array(reverse_k_group(array_to_list(arr),3)).must_equal(expected_result)
  end

  it 'should work 2' do
    arr = [1,2]
    expected_result = [1,2]
    list_to_array(reverse_k_group(array_to_list(arr),3)).must_equal(expected_result)
  end

  it 'should work 3' do
    arr = [1,2,3,4,5,6,7,8,9]
    expected_result = [3,2,1,6,5,4,9,8,7]
    list_to_array(reverse_k_group(array_to_list(arr),3)).must_equal(expected_result)
  end

  it 'should work 4' do
    arr = [1,2,3,4,5,6,7,8,9]
    expected_result = [4,3,2,1,8,7,6,5,9]
    list_to_array(reverse_k_group(array_to_list(arr),4)).must_equal(expected_result)
  end
end
