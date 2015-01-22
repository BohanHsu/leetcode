class Solution:

    def __init__(self):
        self.s = []
        self.h = {}

    # @return a boolean
    def isScramble(self, s1, s2):
        self.s = []
        self.h = {}
        if self.haveSameChar(s1, s2):
            self.s.append((s1, s2))
            while self.s:
                n = self.s[-1]
                self.scramble(n[0], n[1])

            return self.h[(s1, s2)]
        else:
            return False

    def scramble(self, s1, s2):
        is_scra = False
        if (s1, s2) in self.h:
            self.s.pop()
            return self.h[(s1, s2)]
        elif len(s1) == 1 and len(s2) == 1:
            is_scra = s1 == s2
            self.h[(s1, s2)] = is_scra
            self.s.pop()
            return is_scra
        else:
            length = len(s1)
            missing_value = False
            for i in range(1, length):
                if self.haveSameChar(s1[0:i], s2[0:i]) and self.haveSameChar(s1[i:length], s2[i:length]):
                    if not (s1[0:i], s2[0:i]) in self.h:
                        self.s.append((s1[0:i], s2[0:i]))
                        missing_value = True

                    if not (s1[i:length], s2[i:length]) in self.h:
                        self.s.append((s1[i:length], s2[i:length]))
                        missing_value = True

                    if (s1[0:i], s2[0:i]) in self.h and (s1[i:length], s2[i:length]) in self.h:
                        is_scra = is_scra or (self.h[(s1[0:i], s2[0:i])] and self.h[(s1[i:length], s2[i:length])])

                if self.haveSameChar(s1[0:i], s2[length-i:length]) and self.haveSameChar(s1[i:length], s2[0:length-i]):
                    if not (s1[0:i], s2[length-i:length]) in self.h:
                        self.s.append((s1[0:i], s2[length-i:length]))
                        missing_value = True

                    if not (s1[i:length], s2[0:length-i]) in self.h:
                        self.s.append((s1[i:length], s2[0:length-i]))
                        missing_value = True

                    if (s1[0:i], s2[length-i:length]) in self.h and (s1[i:length], s2[0:length-i]) in self.h:
                        is_scra = is_scra or (self.h[(s1[0:i], s2[length-i:length])] and self.h[(s1[i:length], s2[0:length-i])])

            if not missing_value:
                self.h[(s1, s2)] = is_scra
                self.s.pop()

    def haveSameChar(self, s1, s2):
        l1 = [x for x in s1]
        l2 = [x for x in s2]
        l1.sort()
        l2.sort()
        ss1 = "".join(l1)
        ss2 = "".join(l2)
        return ss1 == ss2
