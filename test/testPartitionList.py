import os
import sys
import unittest

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(CURRENT_DIR))

from partitionList import ListNode
from partitionList import Solution

class TestSolutionClass(unittest.TestCase):
    def setUp(self):
        self.s = Solution()

    def test_partition1(self):
        n1 = ListNode(1)
        n2 = ListNode(4)
        n3 = ListNode(3)
        n4 = ListNode(2)
        n5 = ListNode(5)
        n6 = ListNode(2)
        n1.next = n2
        n2.next = n3
        n3.next = n4
        n4.next = n5
        n5.next = n6
        head = self.s.partition(n1, 3)
        self.assertEqual(head, n1)
        self.assertEqual(n1.next, n4)
        self.assertEqual(n4.next, n6)
        self.assertEqual(n6.next, n2)
        self.assertEqual(n2.next, n3)
        self.assertEqual(n3.next, n5)
        self.assertEqual(n5.next, None)

    def test_partition2(self):
        n1 = ListNode(5)
        n2 = ListNode(3)
        n3 = ListNode(4)
        n4 = ListNode(6)
        n1.next = n2
        n2.next = n3
        n3.next = n4
        head = self.s.partition(n1, 3)
        self.assertEqual(head, n1)
        self.assertEqual(n1.next, n2)
        self.assertEqual(n2.next, n3)
        self.assertEqual(n3.next, n4)

    def test_partition3(self):
        n1 = ListNode(1)
        n2 = ListNode(3)
        n3 = ListNode(2)
        n4 = ListNode(5)
        n1.next = n2
        n2.next = n3
        n3.next = n4
        head = self.s.partition(n1, 6)
        self.assertEqual(head, n1)
        self.assertEqual(n1.next, n2)
        self.assertEqual(n2.next, n3)
        self.assertEqual(n3.next, n4)


if __name__ == '__main__':
    unittest.main()
