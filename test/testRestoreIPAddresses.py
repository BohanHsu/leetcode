import os
import sys
import unittest

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(CURRENT_DIR))

from restoreIPAddresses import Solution

class TestSolutionClass(unittest.TestCase):
    def setUp(self):
        self.s = Solution()

    def test_restore_ip_addresses1(self):
        ip = "25525511135"
        self.assertEqual(self.s.restoreIpAddresses(ip), ["255.255.11.135",
            "255.255.111.35"])

    def test_restore_ip_addresses2(self):
        ip = "0000"
        self.assertEqual(self.s.restoreIpAddresses(ip), ['0.0.0.0'])

    def test_restore_ip_addresses3(self):
        ip = "010010"
        self.assertEqual(self.s.restoreIpAddresses(ip),
                ["0.10.0.10","0.100.1.0"])

if __name__ == '__main__':
    unittest.main()
