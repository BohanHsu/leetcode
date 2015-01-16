# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    # @param head, a ListNode
    # @param m, an integer
    # @param n, an integer
    # @return a ListNode
    def reverseBetween(self, head, m, n):
        current_index = 1
        current_point = head
        first_part_end_point = None
        second_part_start_point = None
        second_part_last_point = None
        third_part_start_point = None
        while current_point and current_index <= n:
            if current_index == m - 1:
                first_part_end_point = current_point

            if current_index == m:
                second_part_last_point = current_point

            if current_index == n:
                third_part_start_point = current_point.next

            if current_index >= m and current_index <= n:
                tmp_point = current_point.next
                current_point.next = second_part_start_point
                second_part_start_point = current_point
                current_point = tmp_point
            else:
                current_point = current_point.next

            current_index = current_index + 1

        if first_part_end_point:
            first_part_end_point.next = second_part_start_point
        else:
            head = second_part_start_point
        second_part_last_point.next = third_part_start_point
        return head
