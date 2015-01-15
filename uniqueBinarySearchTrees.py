class Solution:
  counts = {0: 1, 1: 1, 2: 2}
  # @return an integer
  def numTrees(self, n):
    sum = 0
    for i in range(0,n):
      left = i-0 
      right = n-i-1
      sum += self.getNumTrees(left) * self.getNumTrees(right)

    return sum


  def getNumTrees(self, n):
    if n in self.counts.keys():
      return self.counts[n]
    else:
      num = self.numTrees(n)
      self.counts[n] = num
      return num
      
# test
s = Solution()
print s.numTrees(4)
