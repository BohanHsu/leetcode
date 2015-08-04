require 'minitest/autorun'
require '../parlindrome_linked_list'

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def atl(array)
  head = nil
  tail = nil
  array.each do |e|
    n = ListNode.new e
    if head.nil?
      head = n
    else
      tail.next = n
    end
    tail = n
  end
  head
end

describe 'atl' do
  it 'should work' do
    arr = [1,2,3]
    head = atl(arr)

    head.val.must_equal(1)
    head.next.wont_be_nil
    head = head.next
    head.val.must_equal(2)
    head.next.wont_be_nil
    head = head.next
    head.val.must_equal(3)
    head.next.must_equal(nil)
  end
end

describe 'is_palindrome(head)' do
  it 'should work' do
    a = []
    is_palindrome(atl(a)).must_equal(true)
    a = [1]
    is_palindrome(atl(a)).must_equal(true)
    a = [1,2,3,2,1]
    is_palindrome(atl(a)).must_equal(true)
    a = [1,2,3,3,2,1]
    is_palindrome(atl(a)).must_equal(true)
  end

  it 'should work' do
    a = [1,2]
    is_palindrome(atl(a)).must_equal(false)
    a = [1,2,3,2,1,1]
    is_palindrome(atl(a)).must_equal(false)
  end
end
