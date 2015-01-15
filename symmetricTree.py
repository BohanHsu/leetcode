import collections
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
  # @param root, a tree node
  # @return a boolean
  def isSymmetric(self, root):
    if not root:
      return True

    if not root.left and not root.right:
      return True

    if not root.left and root.right:
      return False

    if root.left and not root.right:
      return False

    ql = collections.deque()
    qr = collections.deque()
    ql.append(root.left)
    qr.append(root.right)

    while ql:
      nl = ql.popleft()
      nr = qr.popleft()
      if nl.val != nr.val:
        return False

      if nl.left and nr.right:
        # add to q
        ql.append(nl.left)
        qr.append(nr.right)
      elif not nl.left and nr.right:
        return False
      elif nl.left and not nr.right:
        return False

      if nl.right and nr.left:
        # add to q
        ql.append(nl.right)
        qr.append(nr.left)
      elif not nl.right and nr.left:
        return False
      elif nl.right and not nr.left:
        return False

    return True

# test code
s = Solution()

t1 = TreeNode(1)
t2 = TreeNode(2)
t3 = TreeNode(2)
t4 = TreeNode(3)
t5 = TreeNode(4)
t6 = TreeNode(4)
t7 = TreeNode(3)

t1.left = t2
t1.right = t3
t2.left = t4
t2.right = t5
#t3.left = t6
t3.right = t7

print s.isSymmetric(t1)
