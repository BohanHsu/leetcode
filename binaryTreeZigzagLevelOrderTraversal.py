import collections
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
  def __init__(self):
    self.level = []

  # @param root, a tree node
  # @return a list of lists of integers
  def levelOrder(self, root):
    if not root:
      return self.level

    q = collections.deque()
    dist = {}
    q.append(root)
    dist[root] = 1

    while q:
      n = q.popleft()
      self.addToLevel(n,dist[n])
      if n.left:
        q.append(n.left)
        dist[n.left] = dist[n] + 1

      if n.right:
        q.append(n.right)
        dist[n.right] = dist[n] + 1

    i = 0
    for li in self.level:
      if i % 2 == 1:
        li.reverse()

      i = i + 1

    return self.level

  def addToLevel(self,n,l):
    if len(self.level) < l:
      self.level.append([])

    self.level[l - 1].append(n.val)

# test code 
t1 = TreeNode(3)
t2 = TreeNode(9)
t3 = TreeNode(20)
t4 = TreeNode(15)
t5 = TreeNode(7)

t1.left = t2
t1.right = t3
t3.left = t4
t3.right = t5

s = Solution()
print s.levelOrder(t1)
