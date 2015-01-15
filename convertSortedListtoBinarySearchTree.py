import collections
class TreeNode:
  def __init__(self, x):
      self.val = x
      self.left = None
      self.right = None

class ListNode:
  def __init__(self, x):
      self.val = x
      self.next = None

class Solution:
  def __init__(self):
    self.index = {}
    self.root = {}
    self.position = {}
    self.queue = collections.deque()

  # @param head, a list node
  # @return a tree node
  def sortedListToBST(self, head):
    if not head:
      return None

    i = 0
    n = head
    while n:
      self.index[i] = n
      i = i + 1
      n = n.next

    root = self.handleInterval((0,i),True)
    while self.queue:
      interval = self.queue.popleft()
      self.handleInterval(interval)
        
    return root

  # effect: if this is a real interval, get the root node, add left 
  # interval and right interval to queue. mark position of those interval
  # else add none to Node position
  # @return
  def handleInterval(self,interval,isRoot=False):
    ind = self.getRootIndexByInterval(interval)
    if ind is not None:
      r = TreeNode(self.index[ind].val)
      if not isRoot:
        if self.position[interval] == 'l':
          self.root[interval].left = r
        elif self.position[interval] == 'r':
          self.root[interval].right = r

      self.queue.append((interval[0],ind))
      self.root[(interval[0],ind)] = r
      self.position[(interval[0],ind)] = 'l'
      self.queue.append((ind+1,interval[1]))
      self.root[(ind+1,interval[1])] = r
      self.position[(ind+1,interval[1])] = 'r'
      return r
    else:
      return None

  # @interval: part of the list represent by index
  # example (a,b) a is index of first element, b-1 is index of last element
  # @return root node index in this interval
  # if this is empty interval return None
  def getRootIndexByInterval(self,interval):
    if interval[1] - interval[0] == 0:
      return None
    else:
      return (interval[1] - interval[0])/2 + interval[0]
    
# test code
s = Solution()

last = None
for i in range(0,1):
  l = ListNode(i)
  if i == 0:
    head = l
  else:
    last.next = l

  last = l

#l = head
#while l:
#  print l.val
#  l = l.next

root = s.sortedListToBST(head)

import balancedBinaryTree
bst = balancedBinaryTree.Solution()
print bst.isBalanced(root)
print root.val

q = collections.deque()
q.append(root)
while q:
  n = q.popleft()
  if n.left:
    print n.val, ' left=', n.left.val
    q.append(n.left)
  if n.right:
    print n.val, ' right=', n.right.val
    q.append(n.right)
  
