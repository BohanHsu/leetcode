# Definition for a  binary tree node
class TreeNode:
  def __init__(self, x):
    self.val = x
    self.left = None
    self.right = None

class Solution:
  bsts = {}
  # @return a list of tree node
  def generateTrees(self, n):
    self.initBsts()
    callingStack = []
    k = n
    while not k in self.bsts:
      callingStack.append(k)
      k = k - 1

    while callingStack:
      self.enumAllTreeOfLengthN(callingStack.pop())

    content = [x for x in range(1,n+1)]
    result = []
    for bst in self.bsts[n]:
      result.append(bst.addContent(content))

    return result
   
  # assume that n-1 is in self.bsts
  def enumAllTreeOfLengthN(self, n):
    print 'enumAllTreeOfLengthN: n=', n
    if n in self.bsts:
      return self.bsts[n]

    bstn = []
    for i in range(0,n):
      leftLength = i-0
      rightLength = n-i-1
      print 'leftLength =', leftLength
      print 'rightLength =', rightLength
      leftAllBsts = self.bsts[leftLength]
      rightAllBsts = self.bsts[rightLength]
      for leftBst in leftAllBsts:
        for rightBst in rightAllBsts:
          bstNow = Bst.createByLeftRight(leftBst, rightBst)
          bstn.append(bstNow)

    self.bsts[n] = bstn

  def initBsts(self):
    self.bsts = {}
    bst0 = Bst(None, [])
    self.bsts[0] = [bst0]
    tn = TreeNode(None)
    bst1 = Bst(tn, [tn])
    self.bsts[1] = [bst1]

class Bst:
  def __init__(self, root, sequence):
    self.root = root
    self.sequence = sequence

  def addContent(self, content):
    print 'addContent'
    print len(content)
    print len(self.sequence)
    for i in range(0, len(content)):
      print self.sequence[i]
      self.sequence[i].val = content[i]

    #print 'in addContent'
    #showTree(self.root)
    return self.root

  @classmethod
  def createByLeftRight(cls, left, right):
    root = TreeNode(None)
    root.left = Bst.cloneTree(left.root)
    root.right = Bst.cloneTree(right.root)
    sequence = left.sequence + [root] + right.sequence
    return Bst(root, sequence)
  
  @classmethod
  def cloneTree(cls, root):
    if not root:
      return None

    cloned = {}
    stack = []
    stack.append(root)
    while stack:
      n = stack.pop()
      if n in cloned:
        nCloned = cloned[n]
      else:
        nCloned = TreeNode(n.val)
        cloned[n] = nCloned
        
      if n.left:
        nLeft = TreeNode(n.left.val)
        nCloned.left = nLeft
        cloned[n.left] = nLeft
        stack.append(n.left)

      if n.right:
        nRight = TreeNode(n.right.val)
        nCloned.right = nRight
        cloned[n.right] = nRight
        stack.append(n.right)

    return cloned[root]

#test 
#t0 = TreeNode(0)
#t1 = TreeNode(1)
#t2 = TreeNode(2)
#t3 = TreeNode(3)
#t4 = TreeNode(4)
#t5 = TreeNode(5)
#t6 = TreeNode(6)
#t7 = TreeNode(7)
#t8 = TreeNode(8)
#
#t0.left = t1
#t0.right = t2
#t1.left = t3
#t1.right = t4
#t2.left = t5
#t2.right = t6
#t3.left = t7
#t3.right = t8
#
#clonedRoot = Bst.cloneTree(t0)
#

def showTree(root):
  print '========= begin show tree'
  stack = [root]
  while stack:
    n = stack.pop()
    print n.val
    if n.left:
      print n.val, '.left -> ', n.left.val
  
    if n.right:
      print n.val, '.right -> ', n.right.val
  
    if n.left:
      stack.append(n.left)
      stack.append(n.right)

  print '========= end show tree'

# test2
s = Solution()
bsts = s.generateTrees(3)
for bst in bsts:
  showTree(bst)
