import collections 
class TreeNode:
   def __init__(self, x):
     self.val = x
     self.left = None
     self.right = None

class Solution:
  def __init__(self):
    self.isBST = {}

  # @param root, a tree node
  # @return a boolean
  def isValidBST(self, root):
    if not root:
      return False

    stack = []
    stack.append(root)
    while stack:
      n = stack[-1]
      nl = False
      nr = False
      if n.left:
        if not n.left in self.isBST.keys():
          stack.append(n.left)
        else:
          if self.isBST[n.left]:
            nl = True
          else:
            return False
      else:
        nl = True

      if n.right:
        if not n.right in self.isBST.keys():
          stack.append(n.right)
        else:
          if self.isBST[n.right]:
            nr = True
          else:
            return False
      else:
        nr = True

      if nl and nr:
        self.isBST[n] = False
        if ((not n.left) or n.left.val <= n.val) and ((not n.right) or n.val <= n.right.val):
          self.isBST[n] = True

        stack.pop()

    return self.isBST[root]

# test code
t1 = TreeNode(1)
t2 = TreeNode(2)
t3 = TreeNode(3)
t4 = TreeNode(4)
t5 = TreeNode(0)

t4.left = t2
t4.right = t5
t2.left = t1
t2.right = t3

s = Solution()
print s.isValidBST(t4)
