# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    # @param head, a ListNode
    # @param x, an integer
    # @return a ListNode
    def partition(self, head, x):
        f_start = None
        f_end = None
        s_start = None
        s_end = None
        n = head
        p = None
        while n:
            if n.val >= x:
                if not s_start:
                    s_start = n
                p = n
                n = n.next
            else:
                if not f_start:
                    f_start = n
                else:
                    f_end.next = n

                f_end = n
                n = n.next
                if p:
                    p.next = n

        if f_start:
            n = f_start
            f_end.next = s_start
        else:
            n = s_start

        return n
