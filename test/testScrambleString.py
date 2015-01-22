import os
import sys
import unittest

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(CURRENT_DIR))

from scrambleString import Solution

class TestSolutionClass(unittest.TestCase):
    def setUp(self):
        self.s = Solution()

    def test_isScramble1(self):
        s1 = 'great'
        s2 = 'rgeat'
        self.assertEqual(self.s.isScramble(s1, s2), True)

    def test_isScramble2(self):
        s1 = 'great'
        s2 = 'rgect'
        self.assertEqual(self.s.isScramble(s1, s2), False)

    def test_isScramble3(self):
        s1 = 'great'
        s2 = 'rgtae'
        self.assertEqual(self.s.isScramble(s1, s2), True)

    def test_isScramble4(self):
        s1 = 'abc'
        s2 = 'bca'
        self.assertEqual(self.s.isScramble(s1, s2), True)

if __name__ == "__main__":
    unittest.main()
