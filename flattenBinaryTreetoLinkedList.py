#Definition for a  binary tree node
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
  # @param root, a tree node
  # @return nothing, do it in place
  def flatten(self, root):
    #pass
    if not root:
      return

    stack_node = []
    stack_status = []
    stack_node.append(root)
    stack_status.append(0)
    while stack_node:
      n = stack_node[-1]
      stas = stack_status[-1]
      if stas == 0:
        # goto left
        stack_status[-1] = 1
        if n.left:
          stack_node.append(n.left)
          stack_status.append(0)
      elif stas == 1:
        # goto right
        stack_status[-1] = 2
        if n.right:
          stack_node.append(n.right)
          stack_status.append(0)
      else:
        # goto parent
        n = stack_node.pop()
        stack_status.pop()
        self.visit_node(n)

    print '====='
    self.clean_list(root)
  
  def visit_node(self,n):
    print n.val
    self.f_node(n)

  def f_node(self,n):
    if n.left and n.right:
      # this is a node with both child
      r = n.right
      l = n.left
      n.left = r.left
      n.right = l
      l.left.right = r
    elif n.right:
      # this is a node with only right child
      n.left = n.right.left
    elif n.left:
      # this is a node with 
      n.right = n.left
      n.left = n.left.left
    else:
      # this is a leaf node
      n.left = n

  def clean_list(self,root):
    n = root
    while n:
      n.left = None
      print n.val
      n = n.right

    #def handle_node(self,n):
    #  if n.left and n.right:
    #    # this is a node with both child
    #    handle_node(self,n.left)
    #    handle_node(self,n.right)
    #    r = n.right
    #    l = n.left
    #    n.left = r.left
    #    n.right = l
    #    l.left.right = r
    #  elif n.right:
    #    # this is a node with only right child
    #    handle_node(self,n.right)
    #    n.left = n.right.left
    #  elif n.left:
    #    # this is a node with 
    #    handle_node(self,n.left)
    #    n.right = n.left
    #    n.left = n.left.left
    #  else:
    #    # this is a leaf node
    #    n.left = n

# test case
s = Solution()

t1 = TreeNode(1)
t2 = TreeNode(2)
t3 = TreeNode(3)
t4 = TreeNode(4)
t5 = TreeNode(5)
t6 = TreeNode(6)

t1.left = t2
t2.left = t3
t2.right = t4
t1.right = t5
t5.right = t6

s.flatten(t1)
