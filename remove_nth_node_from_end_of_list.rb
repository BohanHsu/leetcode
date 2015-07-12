# Given a linked list, remove the nth node from the end of list and return its
# head.
#
# For example,
# Given linked list: 1->2->3->4->5, and n = 2.
# After removing the second node from the end, the linked list becomes 1->2->3->5.
# Note:
# Given n will always be valid.
# Try to do this in one pass.

# Definition for singly-linked list.
# # class ListNode
# #     attr_accessor :val, :next
# #     def initialize(val)
# #         @val = val
# #         @next = nil
# #     end
# # end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  return head if head.nil?

  node1 = head
  node2 = nil
  prev = nil
  index = 0

  while !node1.nil? do
    node1 = node1.next

    if index == n - 1
      node2 = head
    else
      prev = node2
      node2 = node2.next if !node2.nil?
    end

    index += 1
  end

  if prev.nil?
    head = node2.next
  else
    prev.next = node2.next
  end
  head
end
