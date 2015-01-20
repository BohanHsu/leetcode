class Solution:

    nums = {}

    def numDecodings(self, s):
        self.nums = {}
        return self.numDecodingsByIndex(s, 0, len(s))

    def numDecodingsByIndex(self, s, start, end):
        if (start, end) in self.nums:
            return self.nums[(start, end)]

        num_of_s = 0
        if len(s) == 1:
            if self.decodable(s):
                num_of_s = 1

        if len(s) == 2:
            deco1 = self.decodable(s[0])
            deco2 = self.decodable(s[1])
            deco12 = self.decodable(s)
            if deco1 and deco2 and deco12:
                return 2
            elif deco1 and deco2 and not deco12:
                return 1
            elif deco12 and not (deco1 and deco2):
                return 1
            else:
                return 0

        if len(s) > 2:
            deco1 = self.decodable(s[0])
            deco2 = self.decodable(s[0:2])
            if deco1 and deco2:
                num_of_s = self.numDecodingsByIndex(s[1:], start + 1, end) + self.numDecodingsByIndex(s[2:], start + 2, end)
            elif deco1 and not deco2:
                num_of_s = self.numDecodingsByIndex(s[1:], start + 1, end)
            elif not deco1 and deco2:
                num_of_s = self.numDecodingsByIndex(s[2:], start + 2, end)
            elif not deco1 and not deco2:
                num_of_s = 0

        self.nums[(start, end)] = num_of_s
        return num_of_s

    def decodable(self, s):
        if len(s) == 2 and s[0] == '0':
            return False
        code = int(s) 
        return code >= 1 and code <= 26
