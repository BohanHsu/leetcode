class Solution:

    results = []
    # @param s, a string
    # @return a list of strings
    def restoreIpAddresses(self, s):
        self.results = []
        self.is_valid_of_part_of_ip(s, [])
        return self.results

    # @param s, a string
    # @param part, a list, of valid ip part
    def is_valid_of_part_of_ip(self, s, parts):
        if len(parts) == 3:
            if self.is_valid_ip_single_part(s):
                parts.append(s)
                valid_ip = ".".join(parts)
                self.results.append(valid_ip)
                return True
            else:
                return False
        else:
            for i in range(1, 4):
                str = s[0:i]
                left_part = s[i:]
                if self.is_valid_ip_single_part(str):
                    new_parts = list(parts)
                    new_parts.append(str)
                    self.is_valid_of_part_of_ip(left_part, new_parts)


    def is_valid_ip_single_part(self, s):
        if len(s) == 0:
            return False
        test_num = int(s)
        return str(test_num) == s and test_num <= 255 and test_num >= 0
