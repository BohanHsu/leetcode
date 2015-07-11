# Given a linked list, swap every two adjacent nodes and return its head.
# For example,
# Given 1->2->3->4, you should return the list as 2->1->4->3.
# Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.

# Definition for singly-linked list.
# # class ListNode
# #     attr_accessor :val, :next
# #     def initialize(val)
# #         @val = val
# #         @next = nil
# #     end
# # end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  return nil if head.nil?
  return head if head.next.nil?
  next_start = head.next.next
  this_end = head.next
  this_end.next = head
  head.next = next_start
  head = this_end
  this_end = head.next

  last_end = this_end
  while !last_end.next.nil? && !last_end.next.next.nil? do
    this_start = last_end.next
    this_end = last_end.next.next
    next_start = this_end.next
    last_end.next = this_end
    this_end.next = this_start
    this_start.next = next_start
    last_end = this_start
  end

  head
end
