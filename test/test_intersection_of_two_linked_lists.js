var iotll = require('../intersection_of_two_linked_lists')

var ListNode = iotll['ListNode']
var list_length = iotll['list_length']
var move_forward = iotll['move_forward']
var getIntersectionNode = iotll['getIntersectionNode']

exports['test list length 1'] = function (test) {
  test.equal(list_length(null), 0)
  test.done()
}

exports['test list length 2'] = function (test) {
  var n1 = new ListNode(1)
  var n2 = new ListNode(2)
  var n3 = new ListNode(3)
  var n4 = new ListNode(4)
  var n5 = new ListNode(5)
  n1.next = n2
  n2.next = n3
  n3.next = n4
  n4.next = n5
  test.equal(list_length(n1), 5)
  test.done()
}

exports['test move forward 1'] = function (test) {
  var n1 = new ListNode(1)
  var n2 = new ListNode(2)
  var n3 = new ListNode(3)
  var n4 = new ListNode(4)
  var n5 = new ListNode(5)
  n1.next = n2
  n2.next = n3
  n3.next = n4
  n4.next = n5
  test.equal(move_forward(n1, 3), n4)
  test.done()
}

exports['test getIntersectionNode 1'] = function (test) {
  var n1 = new ListNode(1)
  var n2 = new ListNode(2)
  var n3 = new ListNode(3)
  var n4 = new ListNode(4)
  var n5 = new ListNode(5)
  n1.next = n2
  n2.next = n3
  n3.next = n4
  n4.next = n5

  var m1 = new ListNode(1)
  var m2 = new ListNode(2)
  var m3 = new ListNode(3)
  m1.next = m2
  m2.next = m3

  test.equal(getIntersectionNode(n1, m1), null)
  test.done()
}

exports['test getIntersectionNode 2'] = function (test) {
  var n1 = new ListNode(1)
  var n2 = new ListNode(2)
  var n3 = new ListNode(3)
  var n4 = new ListNode(4)
  var n5 = new ListNode(5)
  n1.next = n2
  n2.next = n3
  n3.next = n4
  n4.next = n5

  var m1 = new ListNode(1)
  var m2 = new ListNode(2)
  var m3 = new ListNode(3)
  m1.next = m2
  m2.next = m3
  m3.next = n3

  test.equal(getIntersectionNode(n1, m1), n3)
  test.done()
}

exports['test getIntersectionNode 3'] = function (test) {
  var n1 = new ListNode(1)
  test.equal(getIntersectionNode(n1, n1), n1)
  test.done()
}
