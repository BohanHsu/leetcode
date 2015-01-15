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
        s1 = []
        s2 = []
        sequence = []
        n = root
        if n:
            s1.append(n)
            s2.append(False)
        while s1:
            n = s1[-1]
            if n.left and not s2[-1]:
                s2[-1] = True
                s1.append(n.left)
                s2.append(False)
            else:
                n = s1.pop()
                s2.pop()
                sequence.append(n.val)
                if n.right:
                    s1.append(n.right)
                    s2.append(False)

        return sequence
