require 'minitest/autorun'
require '../delete_node_in_a_linked_list'

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
end

describe 'delete_node(node)' do
  it 'should work 1' do
    head = atl [1,2,3,4]
    n = head.next.next
    delete_node(n)
    lta(head).must_equal([1,2,4])
  end
end
