# Remove all elements from a linked list of integers that have value val.

# Example
# Given: 1 --> 2 --> 6 --> 3 --> 4 --> 5 --> 6, val = 6
# Return: 1 --> 2 --> 3 --> 4 --> 5

# Definition for singly-linked list.
# # class ListNode
# #     attr_accessor :val, :next
# #     def initialize(val)
# #         @val = val
# #         @next = nil
# #     end
# # end

# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
  return nil if head.nil?

  while !head.nil? && head.val == val do
    head = head.next
  end

  return nil if head.nil?

  node = head.next
  prev = head

  while !node.nil? do
    if node.val == val
      node = node.next
      prev.next = node
    else
      prev = node
      node = prev.next
    end
  end

  head
end
