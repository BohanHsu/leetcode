import os
import sys
import unittest

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(CURRENT_DIR))

from binaryTreeInorderTraversal import Solution
from binaryTreeInorderTraversal import TreeNode

s = Solution()

class TestSolutionClass(unittest.TestCase):
    def setUp(self):
        self.s = Solution()

    def test_inordertraversal1(self):
        n1 = TreeNode(1)
        n2 = TreeNode(2)
        n3 = TreeNode(3)
        n1.right = n2
        n2.left = n3
        self.assertEqual(self.s.inorderTraversal(n1), [1, 3, 2])

    def test_inordertraversal2(self):
        n1 = TreeNode(1)
        n2 = TreeNode(2)
        n3 = TreeNode(3)
        n4 = TreeNode(4)
        n5 = TreeNode(5)
        n1.left = n2
        n1.right = n3
        n2.right = n4
        n3.left = n5
        self.assertEqual(self.s.inorderTraversal(n1), [2,4,1,5,3])


if __name__ == '__main__':
    unittest.main()
