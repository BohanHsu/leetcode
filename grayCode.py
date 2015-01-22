class Solution:

    def __init__(self):
        self.h = {}
        self.h[0] = ['0']
        self.h[1] = ['0', '1']
        self.h[2] = ['00', '01', '11', '10']
        self.s = []

    # @return a list of integers
    def grayCode(self, n):
        i = n
        while not i in self.h:
            self.s.append(i)
            i = i - 1

        while self.s:
            i = self.s.pop()
            self.grayCodeByReflect(i)

        return self.grayCodeToIntList(self.h[n])

    def grayCodeByReflect(self, n):
        l1 = self.h[n-1]
        reflected = list(l1)
        reflected.reverse()
        prefix_l1 = ['0' + x for x in l1]
        prefix_reflected = ['1' + x for x in reflected]
        new_list = prefix_l1 + prefix_reflected
        del self.h[n-1]
        self.h[n] = new_list

    def grayCodeToIntList(self, code):
        return [self.bin_str_to_int(x) for x in code]

    def bin_str_to_int(self, s):
        return int(s, 2)
