# Given a list, rotate the list to the right by k places, where k is 
# non-negative.
#
# For example:
# Given 1->2->3->4->5->NULL and k = 2,
# return 4->5->1->2->3->NULL.

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return nil if head.nil?
  len = 0
  n = head 
  while !n.nil? do
    p = n
    n = n.next
    len += 1
  end

  p.next = head
  n = head

  ((len-k-1) % len).times do
    n = n.next
  end

  head = n.next
  n.next = nil
  head
end
