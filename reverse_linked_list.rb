# Reverse a singly linked list.

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
def reverse_list(head)
  return nil if head.nil?

  new_head = nil
  node = head

  while !node.nil? do
    next_node = node.next
    node.next = new_head
    new_head = node
    node = next_node
  end

  new_head
end
