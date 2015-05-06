function ListNode(val) {
    this.val = val;
    this.next = null;
}

/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
var getIntersectionNode = function(headA, headB) {
  var len1 = list_length(headA)
  var len2 = list_length(headB)

  var len_diff
  if (len1 > len2) {
    len_diff = len1 - len2
    headA = move_forward(headA, len_diff)
  } else if (len2 > len1) {
    len_diff = len2 - len1
    headB = move_forward(headB, len_diff)
  }

  while (headA !== null && headB !== null) {
    if (headA === headB) {
      return headA
    }
    headA = headA.next
    headB = headB.next
  }

  return null
};

var move_forward = function (head, num) {
  var i = 0
  while (i < num) {
    i++
    head = head.next
  }
  return head
}

var list_length = function (head) {
  count = 0
  n = head
  while (n !== null) {
    n = n.next
    count++
  }
  return count
}

module.exports['ListNode'] = ListNode
module.exports['list_length'] = list_length
module.exports['move_forward'] = move_forward
module.exports['getIntersectionNode'] = getIntersectionNode
