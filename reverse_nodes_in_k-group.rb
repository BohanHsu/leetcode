# Given a linked list, reverse the nodes of a linked list k at a time and return
# its modified list.
# If the number of nodes is not a multiple of k then left-out nodes in the end
# should remain as it is.
# You may not alter the values in the nodes, only nodes itself may be changed.
# Only constant memory is allowed.
# For example,
# Given this linked list: 1->2->3->4->5
# For k = 2, you should return: 2->1->4->3->5
# For k = 3, you should return: 3->2->1->4->5

# Definition for singly-linked list.
# # class ListNode
# #     attr_accessor :val, :next
# #     def initialize(val)
# #         @val = val
# #         @next = nil
# #     end
# # end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  return head if k == 1
  point = head
  n = nil
  count = 1
  while count < k && !point.nil? do
    point = point.next
    count += 1 unless point.nil?
  end

  this_end = nil
  if count == k
    next_start = point.next
    j = 0
    while j < k - 1 do
      node = head
      this_end = node if this_end.nil?
      head = head.next
      next_start = point.next
      point.next = node
      node.next = next_start
      j += 1
    end
    n = this_end

    while count == k do
      count = 0
      point = n
      while count < k && !point.nil? do
        point = point.next
        count += 1 unless point.nil?
      end

      this_end = nil

      if count == k
        next_start = point.next
        j = 0
        while j < k - 1 do
          node = n.next
          n.next = node.next

          point.next = node
          node.next = next_start
          next_start = node
          this_end = node if this_end.nil?
          j += 1
        end
        n = this_end
      end
    end
  end
  head
end
