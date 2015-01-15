import collections
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
  # @param root, a tree node
  # @param sum, an integer
  # @return a boolean
  def hasPathSum(self, root, sum):
    queue = collections.deque()
    if not root:
      return False

    if not root.left and not root.right and root.val == sum:
      return True

    queue.append(root)
    while queue:
      n = queue.popleft()
      if n.left:
        queue.append(n.left)
        n.left.val = n.left.val + n.val
        if self.checkNode(n.left,sum):
          return True

      if n.right:
        queue.append(n.right)
        n.right.val = n.right.val + n.val
        if self.checkNode(n.right,sum):
          return True
        
    return False

  def checkNode(self,n,sum):
    if n.val == sum and not n.left and not n.right:
      return True
    else:
      return False

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
t9 = TreeNode(1)

#t1.left = t2
#t1.right = t3
t2.left = t4
t4.left = t7
t4.right = t8
t3.left = t5
t3.right = t6
t6.right = t9

print s.hasPathSum(t1,5)
