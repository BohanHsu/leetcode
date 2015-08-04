# Given a singly linked list, determine if it is a palindrome.

# Follow up:
# Could you do it in O(n) time and O(1) space?

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
  len = 0
  n = head
  while n do
    len += 1
    n = n.next
  end

  return true if len <= 1

  new_head = nil

  (len / 2).times do
    n = head
    head = head.next
    n.next = new_head
    new_head = n
  end

  if len.odd?
    head = head.next
  end

  n1 = head
  n2 = new_head
  while !n1.nil? && !n2.nil? do
    return false if n1.val != n2.val
    n1 = n1.next
    n2 = n2.next
  end
  true
end
