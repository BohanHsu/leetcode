import math
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
  def __init__(self):
    self.depth = {}
    self.depth[None] = 0

  # @param root, a tree node
  # @return a boolean
  def isBalanced(self, root):
    stack_node = []
    stack_status = []
    if not root:
      return True
    
    stack_node.append(root)
    stack_status.append(0)
    while stack_node:
      n = stack_node[-1]
      s = stack_status[-1]
      if s == 0:
        # goto left
        stack_status[-1] = 1
        if n.left:  
          stack_node.append(n.left)
          stack_status.append(0)

      elif s == 1:
        # goto right
        stack_status[-1] = 2
        if n.right:
          stack_node.append(n.right)
          stack_status.append(0)

      else:
        #pop
        n = stack_node.pop()
        stack_status.pop()
        if not self.checkBalance(n):
          return False

    return True

  # @n: a node
  # @effect: check if this node is balanced, if true set the depth hash
  #   else do nothing
  # @return: True if n is balanced
  def checkBalance(self,n):
    #if not self.
    if math.fabs(self.depth[n.left] - self.depth[n.right]) <= 1:
      self.depth[n] = max(self.depth[n.left], self.depth[n.right]) + 1
      return True
    else:
      return False

# test code
#s = Solution()
#
#t1 = TreeNode(1)
#t2 = TreeNode(2)
#t3 = TreeNode(3)
#t4 = TreeNode(4)
#t5 = TreeNode(5)
#t6 = TreeNode(6)
#t7 = TreeNode(7)
#
#t1.left = t2
#t1.right = t3
#t2.left = t4
#t2.right = t5
#t3.left = t6
#t4.left = t7
#
#print s.isBalanced(t1)
#
#ta = TreeNode(1)
#tb = TreeNode(2)
#tc = TreeNode(3)
#
#ta.left = tb
#tb.left = tc
#
#print s.isBalanced(ta)
