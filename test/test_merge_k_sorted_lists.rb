require 'minitest/autorun'
require '../merge_k_sorted_lists'

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

describe 'merge_k_lists(lists)' do
  it 'should work 1' do
    list_of_arrays = [
      [1,3,5,7,9],
      [2,4,6]
    ]

    lists = list_of_arrays.map do |arr|
      array_to_list(arr.sort)
    end

    #byebug

    expected_result = list_of_arrays.inject do |memo, obj|
      memo + obj
    end.sort

    list_to_array(merge_k_lists(lists)).must_equal(expected_result)
  end

  it 'should work' do
    list_of_arrays = [
      [1,4,3,2,5,2],
      [21,2,5,6,67,4],
      [12,31,46,5,24,3],
      [11,22,33,44]
    ]

    lists = list_of_arrays.map do |arr|
      array_to_list(arr.sort)
    end

    #byebug

    expected_result = list_of_arrays.inject do |memo, obj|
      memo + obj
    end.sort

    list_to_array(merge_k_lists(lists)).must_equal(expected_result)
  end
end
