import collections
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
  # @param root, a tree node
  # @return an integer
  def maxDepth(self, root):
    if not root:
      return 0
    q = collections.deque()
    depth = {}
    q.append(root)
    depth[root] = 1
    maxDep = 0
    while q:
      n = q.popleft()
      maxDep = depth[n]
      if n.left:
        q.append(n.left)
        depth[n.left] = depth[n] + 1
         
      if n.right:
        q.append(n.right)
        depth[n.right] = depth[n] + 1

    return maxDep

# test code 
s = Solution()
t1 = TreeNode(1)
t2 = TreeNode(2)
t3 = TreeNode(3)
t4 = TreeNode(4)
t5 = TreeNode(5)

t1.left = t2
t2.right = t3
t3.left = t4
t4.left = t5

print s.maxDepth(t1)
