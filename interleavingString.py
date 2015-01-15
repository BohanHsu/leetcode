class Solution:

  # @return a boolean
  def isInterleave(self, s1, s2, s3):
    ia = 0
    ib = 0
    ic = 0


    if len(s1) + len(s2) != len(s3):
      return False

    if s1 == "":
      return s2 == s3

    if s2 == "":
      return s1 == s3

    stack = []
    while True:
      ic = ia + ib

      #print '==='
      #print ia
      #print ib
      #print ic
      #print stack

      #if (ia == len(s1)) or (ib == len(s2)) or (not s1[ia] == s3[ic] and not s2[ib] == s3[ic]):
      if (ia == len(s1) or not s1[ia] == s3[ic]) and (ib == len(s2) or not s2[ib] == s3[ic]):
        if ia == len(s1) and ib == len(s2):
          return True
        elif stack:
          p = stack.pop()
          ia = p[0]
          ib = p[1] + 1
        else:
          return False
      else:

        if ia < len(s1) and ib < len(s2) and s1[ia] == s3[ic] and s2[ib] == s3[ic]:
          stack.append((ia,ib))

        if ia < len(s1) and s1[ia] == s3[ic]:
          ia = ia + 1
        elif ib < len(s2) and s2[ib] == s3[ic]:
          ib = ib + 1

# test code
s1 = "d" 
s2 = "a" 
s3 = "ad" 
s = Solution()
print s.isInterleave(s1,s2,s3)
