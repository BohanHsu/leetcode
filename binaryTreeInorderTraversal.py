# Definition for a  binary tree node
class TreeNode:
  def __init__(self, x):
    self.val = x
    self.left = None
    self.right = None

class Solution:
  # @param root, a tree node
  # @return a list of integers
  def inorderTraversal(self, root):
    self.sequence = []
    #self.inorderTraversalWithMethod(root, self.visiting)
    self.inorderTraversalWithMethod(root, Solution.visiting)
    return self.sequence


  def inorderTraversalWithMethod(self, root, visit):
    if not root:
      return []

    sNode = []
    sTag = []
    sNode.append(root)
    sTag.append(False)
    while not sNode:
      if sTag[-1]:
        visit(sNode[-1])
        n = sNode.pop()
        sTag.pop()
        if n.right:
          sNode.append(n.right)
          sTag.append(False)

      elif not sTag[-1]:
        sTag[-1] = True
        if sNode[-1].left:
          sNode.append(sNode[-1].left)
          sTag.append(False)

    def visiting(node):
      self.sequence.append(node.val)

# test 
n1 = TreeNode(1)
n2 = TreeNode(2)
n3 = TreeNode(3)
n4 = TreeNode(4)
n5 = TreeNode(5)
n6 = TreeNode(6)
n7 = TreeNode(7)

n1.left = n2
n1.right = n3
n2.right = n4
n3.left = n5
n5.left = n6
n6.right = n7

print Solution().inorderTraversal(n1)
