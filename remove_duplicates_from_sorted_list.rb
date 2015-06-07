# Given a sorted linked list, delete all duplicates such that each element appear only once.

# For example,
# Given 1->1->2, return 1->2.
# Given 1->1->2->3->3, return 1->2->3.

# Definition for singly-linked list.

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
  cur = head
  p = cur
  while !cur.nil? do
    p = cur.next
    while !p.nil? && p.val == cur.val do
      p = p.next
    end
    cur.next = p
    cur = cur.next
  end
  head
end
