require 'minitest/autorun'
require '../remove_nth_node_from_end_of_list'

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def array_to_list(array)
  return nil if array.empty?
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

  it 'should return nil for empty array' do
    a = []
    head = array_to_list a
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

  it 'should return empty if given nil' do
    list_to_array(nil).must_equal([])
  end
end

describe 'remove_nth_from_end(head, n)' do
  it 'should work' do
    arr = [1,2,3,4,5]
    n = 2
    expected_result = [1,2,3,5]

    list_to_array(remove_nth_from_end(array_to_list(arr), n)).must_equal(expected_result)
  end

  it 'should work [1], 1' do
    arr = [1]
    n = 1
    expected_result = []
    list_to_array(remove_nth_from_end(array_to_list(arr), n)).must_equal(expected_result)
  end

  it 'should work [1,2,3], 3' do
    arr = [1,2,3]
    n = 3
    expected_result = [2,3]
    list_to_array(remove_nth_from_end(array_to_list(arr), n)).must_equal(expected_result)
  end
end
