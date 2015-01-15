import collections
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
  # @param root, a tree node
  # @return a tree node
  def recoverTree(self, root):
    n = root
    p = None
    large = None
    while n:
      if n.left:
        m = n.left
        while m.right:
          m = m.right

        l = n.left
        n.left = None
        m.right = n
        n = l
        root = n

      else:
        print n.val
        n = n.right

    return root


# test code 
t1 = TreeNode(4)
t2 = TreeNode(2)
t3 = TreeNode(5)
t4 = TreeNode(1)
t5 = TreeNode(3)
t6 = TreeNode(6)
t7 = TreeNode(7)

t1.left = t2
t1.right = t3
t2.left = t4
t2.right = t5
t3.left = t6
t3.right = t7

s = Solution()
root = s.recoverTree(t1)
print root.val

print t1.left
print t1.right.val
print t2.left
print t2.right.val
print t3.left
print t3.right.val
print t4.left
print t4.right.val
print t5.left
print t5.right.val
print t6.left
print t6.right.val
print t7.left
print t7.right

print '====='

q = collections.deque()
q.append(t1)
while q:
  n = q.popleft()
  print n.val
  if n.left:
    print n.val,'.left', n.left.val
    q.append(n.left)

  if n.right:
    print n.val, '.right', n.right.val
    q.append(n.right)
