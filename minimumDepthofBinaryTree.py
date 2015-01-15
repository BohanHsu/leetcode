import collections
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
  # @param root, a tree node
  # @return an integer
  def minDepth(self, root):
    if not root:
      return 0

    queue =  collections.deque()
    depth = {}
    depth[root] = 1
    queue.append(root)
    while queue:
      n = queue.popleft()
      if not n.left and not n.right:
        return depth[n]

      if n.left:
        queue.append(n.left)
        depth[n.left] = depth[n] + 1

      if n.right:
        queue.append(n.right)
        depth[n.right] = depth[n] + 1

# test code 
t1 = TreeNode(1)
t2 = TreeNode(2)
t3 = TreeNode(3)
t4 = TreeNode(4)
t5 = TreeNode(5)
t6 = TreeNode(6)

t1.left = t2
t1.right = t3
t2.left = t4
t2.right = t5
#t3.left = t6

s = Solution()
print s.minDepth(t1)
