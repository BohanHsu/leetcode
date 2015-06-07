require 'minitest/autorun'
require '../remove_duplicates_from_sorted_list.rb'

def list_to_array(head)
  arr = []
  while !head.nil? do
    arr << head.val
    head = head.next
  end
  arr
end

def array_to_list(arr)
  head = nil
  tail = head
  arr.each do |e|
    if tail.nil?
      tail = ListNode.new e
      head = tail
    else
      tail.next = ListNode.new e
      tail = tail.next
    end
  end
  head
end

describe 'list_to_array' do
  it 'should work' do
    ln1 = ListNode.new 1
    ln2 = ListNode.new 1
    ln3 = ListNode.new 2
    ln4 = ListNode.new 4
    ln5 = ListNode.new 6

    ln1.next = ln2
    ln2.next = ln3
    ln3.next = ln4
    ln4.next = ln5

    list_to_array(ln1).must_equal([1,1,2,4,6])
  end
end

describe 'array_to_list' do
  it 'should work' do
    head = array_to_list([1,1,2,4,6])
    assert_equal(head.val, 1)
    head = head.next
    head.val.must_equal(1)
    head = head.next
    head.val.must_equal(2)
    head = head.next
    head.val.must_equal(4)
    head = head.next
    head.val.must_equal(6)
    head = head.next
    assert_nil head
  end
end

describe 'delete_duplicates' do
  it 'should pass test 1' do
    list_to_array(delete_duplicates(array_to_list([1,1,2]))).must_equal([1,2])
  end

  it 'should pass test 2' do
    list = array_to_list([1,1,2,3,3])
    simple_list = delete_duplicates(list)
    list_to_array(simple_list).must_equal([1,2,3])
  end
end
