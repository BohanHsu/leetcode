/**
 * @constructor
 */
var MinStack = function() {
  this.min_ptr = null
  this.stack_top = null
  self = this
  this.elem = function (val) {
    this.next = self.stack_top
    this.val = val
    this.min_next = null
  }
};

/**
 * @param {number} x
 * @returns {void}
 */
MinStack.prototype.push = function(x) {
  var new_elem = new this.elem(x)
  this.stack_top = new_elem
  if (this.min_ptr === null) {
    new_elem.min_next = this.min_ptr
    this.min_ptr = new_elem
  } else {
    if (this.min_ptr.val > x) {
      new_elem.min_next = this.min_ptr
      this.min_ptr = new_elem
    }
  }
};

/**
 * @returns {void}
 */
MinStack.prototype.pop = function() {
  if (this.min_ptr === this.stack_top && this.stack_top.min_next !== null) {
    this.min_ptr = this.stack_top.min_next
  }
  this.stack_top = this.stack_top.next
  if (this.stack_top === null) {
    this.min_ptr = null
  }
};

/**
 * @returns {number}
 */
MinStack.prototype.top = function() {
  return this.stack_top.val
};

/**
 * @returns {number}
 */
MinStack.prototype.getMin = function() {
  return this.min_ptr.val
};

MinStack.prototype.to_array = function () {
  var a = []
  var n = this.stack_top
  while (n !== null) {
    a.push(n.val)
    n = n.next
  }
  return a
}

module.exports = MinStack
