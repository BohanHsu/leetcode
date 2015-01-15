import collections
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
  # @param p, a tree node
  # @param q, a tree node
  # @return a boolean
  def isSameTree(self, p, q):
    if not p and not q:
      return True

    if not p and q:
      return False

    if p and not q:
      return False

    qp = collections.deque()
    qq = collections.deque()
    qp.append(p)
    qq.append(q)
    while qp and qq:
      p = qp.popleft()
      q = qq.popleft()
      if p.val != q.val:
        return False

      if p.left and q.left:
        qp.append(p.left)
        qq.append(q.left)

      if p.right and q.right:
        qp.append(p.right)
        qq.append(q.right)

      if (p.left and not q.left) or (not p.left and q.left):
        return False

      if (p.right and not q.right) or (not p.right and q.right):
        return False

    return True

# test code

s = Solution()
tp1 = TreeNode(1)
tp2 = TreeNode(2)
tp3 = TreeNode(3)
tp4 = TreeNode(4)
tp5 = TreeNode(5)

tq1 = TreeNode(1)
tq2 = TreeNode(2)
tq3 = TreeNode(3)
tq4 = TreeNode(4)
tq5 = TreeNode(5)

tp1.left = tp2
tp1.right = tp3
tp2.left = tp4
tp2.right = tp5

tq1.left = tq2
tq1.right = tq3
tq2.left = tq4
#tq2.right = tq5

print s.isSameTree(tp1,tq1)
