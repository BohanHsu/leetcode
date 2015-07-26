require 'minitest/autorun'
require '../reverse_linked_list'

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def lta(head)
  results = []
  while !head.nil? do
    results << head.val
    head = head.next
  end
  results
end

def atl(array)
  head = nil
  tail = nil

  array.each do |val|
    node = ListNode.new val
    if head.nil?
      head = node
      tail = node
    else
      tail.next = node
      tail = node
    end
  end
  head
end

describe 'lta && atl' do
  it 'should convert l to a' do
    n1 = ListNode.new 1
    n2 = ListNode.new 2
    n3 = ListNode.new 3
    n4 = ListNode.new 4

    n1.next = n2
    n2.next = n3
    n3.next = n4

    lta(n1).must_equal([1,2,3,4])
  end

  it 'should convert a to l' do
    head = atl([1,2,3,4])
    head.val.must_equal(1)
    head = head.next
    head.val.must_equal(2)
    head = head.next
    head.val.must_equal(3)
    head = head.next
    head.val.must_equal(4)
    head = head.next
    head.must_equal(nil)
  end
end

describe 'reverse_list(head)' do
  it 'should work' do
    array = [1,2,3,4,5,6,7]
    expected_result = array.reverse
    lta(reverse_list(atl(array))).must_equal(expected_result)
  end

  it 'should work 1' do
    array = []
    expected_result = array.reverse
    lta(reverse_list(atl(array))).must_equal(expected_result)
  end
end
