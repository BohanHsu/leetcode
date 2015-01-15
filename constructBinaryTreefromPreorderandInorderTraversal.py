import collections
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

# this code was developed for inorder and postorder, but the methods
# inside is actually inorder and preorder, so I only change the master 
# method's argument name and assign preorder list to a variable named
# postorder.
class Solution:
  def __init__(self):
    self.root = {}
    self.position = {}
    self.q = collections.deque()

  # @param inorder, a list of integers
  # @param postorder, a list of integers
  # @return a tree node
  def buildTree(self, inorder, postorder):
    postorder = preorder
    if not inorder or not postorder:
      return None

    root = self.handleTravsrse(tuple(inorder),tuple(postorder))
    while self.q:
      trav = self.q.popleft()
      self.handleTravsrse(trav[0], trav[1])

    return root

  # @param: same as master method
  # effect: find the root of this sub traverse, 
  #   set left and right traverse into queue
  #   set l and r's position
  # @return: root Node
  def handleTravsrse(self,inorder,postorder):
    #print 'inorder: ', inorder
    #print 'postorder', postorder
    if len(inorder) > 0 and len(postorder) > 0:
      rootVal = postorder[0]
      inorderPosition = inorder.index(rootVal)
      rootNode = TreeNode(rootVal)
      leftInorder = inorder[0:inorderPosition] 
      rightInorder = inorder[(inorderPosition+1):]
      leftPostorder = postorder[1:(inorderPosition+1)]
      rightPostorder = postorder[(inorderPosition+1):]
      #print 'leftInorder',leftInorder
      #print 'leftPostorder',leftPostorder
      #print 'rightInorder',rightInorder
      #print 'rightPostorder',rightPostorder
      self.q.append((leftInorder,leftPostorder))
      self.q.append((rightInorder,rightPostorder))
      self.root[leftInorder] = rootNode
      self.root[rightInorder] = rootNode
      self.position[leftInorder] = 'l'
      self.position[rightInorder] = 'r'
      if inorder in self.root:
        if self.position[inorder] == 'l':
          self.root[inorder].left = rootNode
        elif self.position[inorder] == 'r':
          self.root[inorder].right = rootNode
      return rootNode
    else:
      return None

# test code
s = Solution()
inorder = [4,2,1,6,5,7,3]
postorder = [4,2,6,7,5,3,1]
root = s.buildTree(inorder,postorder)

q = collections.deque()
q.append(root)
while q:
  n = q.popleft();
  print n.val
  if n.left:
    print n.val,'.left = ', n.left.val
    q.append(n.left)

  if n.right:
    print n.val, '.right = ', n.right.val
    q.append(n.right)
