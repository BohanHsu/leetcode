import os
import sys
import unittest

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(CURRENT_DIR))

from reverseLinkedListII import Solution
from reverseLinkedListII import ListNode

class TestSolutionClass(unittest.TestCase):
    def setUp(self):
        self.s = Solution()

    def test_reverse_between1(self):
        n1 = ListNode(1)
        n2 = ListNode(2)
        n3 = ListNode(3)
        n4 = ListNode(4)
        n5 = ListNode(5)

        n1.next = n2
        n2.next = n3
        n3.next = n4
        n4.next = n5

        head = self.s.reverseBetween(n1, 2, 4)

        self.assertEqual(n1.next.val, 4)
        self.assertEqual(n2.next.val, 5)
        self.assertEqual(n3.next.val, 2)
        self.assertEqual(n4.next.val, 3)
        self.assertEqual(n5.next, None)

    def test_reverse_between2(self):
        n = ListNode(5)

        head = self.s.reverseBetween(n, 1, 1)

        self.assertEqual(head, n)
        self.assertEqual(n.next, None)

    def test_reverse_between3(self):
        n1 = ListNode(3)
        n2 = ListNode(5)
        #n3 = ListNode(7)

        n1.next = n2

        head = self.s.reverseBetween(n1, 1, 2)
        
        self.assertEqual(head, n2)
        self.assertEqual(n2.next, n1)
        self.assertEqual(n1.next, None)

if __name__ == '__main__':
    unittest.main()
