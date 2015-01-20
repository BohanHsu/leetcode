import os
import sys
import unittest

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(CURRENT_DIR))

from decodeWays import Solution

class TestSolutionClass(unittest.TestCase):
    def setUp(self):
        self.s = Solution()

    def test_numDecodings1(self):
        self.assertEqual(self.s.numDecodings('1'), 1)

    def test_numDecodings12(self):
        self.assertEqual(self.s.numDecodings('12'), 2)

    def test_numDecodings123(self):
        self.assertEqual(self.s.numDecodings('123'), 3)

    def test_numDecodings1234(self):
        self.assertEqual(self.s.numDecodings('1234'), 3)

    def test_numDecodings1223(self):
        self.assertEqual(self.s.numDecodings('1223'), 5)

    def test_numDecodings100(self):
        self.assertEqual(self.s.numDecodings('100'), 0)

    def test_numDecoding301(self):
        self.assertEqual(self.s.numDecodings('301'), 0)

    def test_numDecodings10(self):
        self.assertEqual(self.s.numDecodings('10'), 1)

if __name__ == '__main__':
    unittest.main()
