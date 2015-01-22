import os
import sys
import unittest

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(CURRENT_DIR))

from grayCode import Solution

class TestSolutionClass(unittest.TestCase):
    def setUp(self):
        self.s = Solution()

    def test_grayCodeByRefect(self):
        self.s.grayCodeByReflect(3)
        gray_code3 = ['000', '001', '011', '010', '110', '111', '101', '100']
        self.assertEqual(self.s.h[3], gray_code3)

    def test_grayCodeToIntList(self):
        gray_code3 = ['000', '001', '011', '010', '110', '111', '101', '100']
        int_list = self.s.grayCodeToIntList(gray_code3)
        self.assertEqual(int_list, [0, 1, 3, 2, 6, 7, 5, 4])

    def test_grayCode(self):
        self.s.grayCode(6)

    def test_grayCode0(self):
        self.assertEqual(self.s.grayCode(0), [0])

if __name__ == '__main__':
    unittest.main()
