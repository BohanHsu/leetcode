# Given a sorted linked list, delete all nodes that have duplicate numbers, leaving 
# only distinct numbers from the original list.

# For example,
# Given 1->2->3->3->4->4->5, return 1->2->5.
# Given 1->1->1->2->3, return 2->3.

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
  list = ListNode.new nil
  list.next = head
  cur = list
  while !cur.nil? do
    q = cur.next
    while !(q.nil? || q.next.nil? || !q.next.nil? && (q.val != q.next.val)) do
      p = q
      while !p.nil? && !p.next.nil? && p.val == p.next.val
        p = p.next
      end
      q = p.next
    end
    cur.next = q
    cur = q
  end
  list.next
end


### @param {ListNode} head
### @return {ListNode}
##def delete_duplicates(head)
##  list = ListNode.new nil
##  list.next = head
##  cur = list
##  while !cur.nil? do
##    p = cur.next
##    if p.nil? || p.next.nil? || !p.next.nil? && (p.val != p.next.val)
##      cur.next = p
##    else
##      while !p.nil? && !p.next.nil? && p.val == p.next.val
##        p = p.next
##      end
##      cur.next = p.next
##    end
##    
##    cur = cur.next
##  end
##  list.next
##end
