/* Definition for binary tree */
function TreeNode(val) {
  this.val = val;
  this.left = this.right = null;
}

/**
 * @constructor
 * @param {TreeNode} root - root of the binary search tree
 */
var BSTIterator = function(root) {
  this.current_node = null;
  this.next_node = null;
  this.stack = []
  this.root = root
  this.check_and_initialize()
};


/**
 * @this BSTIterator
 * @returns {boolean} - whether we have a next smallest number
 */
BSTIterator.prototype.hasNext = function() {
  return (this.next_node !== null)
};

/**
 * @this BSTIterator
 * @returns {number} - the next smallest number
 */
BSTIterator.prototype.next = function() {
  this.current_node = this.next_node
  // update this.next

  if (this.current_node.right !== null) {
    // current.right.most_left
    var n = this.current_node.right
    while (n !== null) {
      this.stack.push(n)
      n = n.left
    }
    this.next_node = this.stack[this.stack.length - 1]
  } else {
    if (this.stack.length === 1) {
      this.next_node = null;
      return this.current_node.val
    }
    if (this.current_node === this.stack[this.stack.length - 2].left) {
      // this is left child?
      this.stack.pop()
      this.next_node = this.stack[this.stack.length - 1]
    } else if (this.current_node === this.stack[this.stack.length - 2].right) {
      // this is right child?
      var n = this.current_node
      while (n === this.stack[this.stack.length - 2].right) {
        this.stack.pop()
        n = this.stack[this.stack.length - 1]
        if (this.stack.length === 1) {
          this.next_node = null;
          return this.current_node.val
        }
      }
      this.stack.pop()
      this.next_node = this.stack[this.stack.length - 1]
    }
  }
  
  // end of update this.next
  return this.current_node.val
};

BSTIterator.prototype.check_and_initialize = function() {
  if (this.current_node === null && this.next_node === null) {
    if (this.root === null) {
      return
    }
    var n = this.root
    while(n != null) {
      this.stack.push(n)
      n = n.left
    }
    this.next_node = this.stack[this.stack.length - 1]
  }
}

/**
 * Your BSTIterator will be called like this:
 * var i = new BSTIterator(root), a = [];
 * while (i.hasNext()) a.push(i.next());
*/

module.exports['BSTIterator'] = BSTIterator
module.exports['TreeNode'] = TreeNode
