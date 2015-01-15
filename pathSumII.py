import collections
# Definition for a  binary tree node
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
  def __init__(self):
    self.prev = {}
    self.accumulate = {}
  # @param root, a tree node
  # @param sum, an integer
  # @return a list of lists of integers
  def pathSum(self, root, sum):
    paths = []
    queue = collections.deque()
    if not root:
      return False

    if root.val == sum and not root.left and not root.right:
      return True
    
    queue.append(root)
    self.prev[root] = None
    self.accumulate[root] = root.val
    while queue:
      n = queue.popleft()
      if n.left:
        queue.append(n.left)
        self.accumulate[n.left] = n.left.val + self.accumulate[n]
        self.prev[n.left] = n
        if self.checkNode(n.left,sum):
          # this is a path
          paths.append(self.getPath(n.left))

      if n.right:
        queue.append(n.right)
        self.accumulate[n.right] = n.right.val + self.accumulate[n]
        self.prev[n.right] = n
        if self.checkNode(n.right,sum):
          # this is a path    
          paths.append(self.getPath(n.right))

    return paths
  
  def checkNode(self,n,sum):
    if self.accumulate[n] == sum and not n.left and not n.right:
      return True
    else:
      return False

  def getPath(self,n):
    path = []
    while n:
      path.append(n)
      n = self.prev[n]

    return path

    return path.reverse()

# test code
s = Solution()

t1 = TreeNode(5)
t2 = TreeNode(4)
t3 = TreeNode(8)
t4 = TreeNode(11)
t5 = TreeNode(13)
t6 = TreeNode(4)
t7 = TreeNode(7)
t8 = TreeNode(2)
t9 = TreeNode(5)
t10 = TreeNode(1)

t1.left = t2
t1.right = t3
t2.left = t4
t3.left = t5
t3.right = t6
t4.left = t7
t4.right = t8
t6.left = t9
t6.right = t10

print s.pathSum(t1,22)
