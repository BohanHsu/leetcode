require 'minitest/autorun'
require '../rotate_list'

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def list_to_array(head)
  n = head
  a = []
  while !n.nil? do
    a << n.val
    n = n.next
  end
  a
end

def array_to_list(array)
  head = nil
  n = nil
  p = nil
  array.each_with_index do |e, i|
    n = ListNode.new e
    if i == 0
      head = n
    else
      p.next = n
    end
    p = n
  end
  head
end

describe 'rotate_right' do
  it 'should pass test 1' do
    list_to_array(
      rotate_right(array_to_list([1,2,3,4,5]), 1)).must_equal([5,1,2,3,4])
  end

  it 'should pass test 2' do
    list_to_array(
      rotate_right(array_to_list([1,2,3,4,5]), 2)).must_equal([4,5,1,2,3])
  end

  it 'should pass test 3' do
    list_to_array(
      rotate_right(array_to_list([1,2]), 2)).must_equal([1,2])
  end

  it 'should pass test 4' do
    list_to_array(
      rotate_right(array_to_list([1]), 0)).must_equal([1])
  end
end

describe 'list_to_array' do
  it 'should convert list to array' do
    n1 = ListNode.new 1
    n2 = ListNode.new 2
    n3 = ListNode.new 3

    n1.next = n2
    n2.next = n3

    list_to_array(n1).must_equal([1,2,3])
  end
end

describe 'array_to_list' do
  it 'should convert array to list' do
    a = [1,2,3,4]
    head = array_to_list(a)
    head.val.must_equal(1)
    head.next.val.must_equal(2)
    head.next.next.val.must_equal(3)
    head.next.next.next.val.must_equal(4)
    head.next.next.next.next.must_equal(nil)
  end
end
