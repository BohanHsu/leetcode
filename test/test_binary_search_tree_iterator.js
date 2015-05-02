bsti = require("../binary_search_tree_iterator")
BSTIterator = bsti['BSTIterator']
TreeNode = bsti['TreeNode']

module.exports['test1'] = function(test) {
  var t1 = new TreeNode(1)
  var t2 = new TreeNode(2)
  var t3 = new TreeNode(3)
  var t4 = new TreeNode(4)
  var t5 = new TreeNode(5)
  var t6 = new TreeNode(6)
  var t7 = new TreeNode(7)
  var t8 = new TreeNode(8)
  var t9 = new TreeNode(9)
  var t10 = new TreeNode(10)
  
  t5.left = t4
  t5.right = t8
  t4.left = t2
  t8.left = t6
  t2.left = t1
  t2.right = t3
  t6.right = t7

  t8.right = t9
  t9.right = t10

  var root = t5
  var n = null

  var i = new BSTIterator(root)
  var i = new BSTIterator(root), a = [];
  while (i.hasNext()) a.push(i.next());

  test.deepEqual(a, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
  test.done()
}

module.exports['test2'] = function(test) {
  var t5 = new TreeNode(5)

  var root = t5
  var n = null

  var i = new BSTIterator(root)
  var i = new BSTIterator(root), a = [];
  while (i.hasNext()) a.push(i.next());

  test.deepEqual(a, [5])
  test.done()
}

module.exports['test3'] = function(test) {
  var t5 = new TreeNode(5)
  var t8 = new TreeNode(8)
  
  t5.right = t8

  var root = t5
  var n = null

  var i = new BSTIterator(root)
  var i = new BSTIterator(root), a = [];
  while (i.hasNext()) a.push(i.next());

  test.deepEqual(a, [5, 8])
  test.done()
}
