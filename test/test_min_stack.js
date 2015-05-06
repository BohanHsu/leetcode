MinStack = require('../min_stack')

module.exports['test1'] = function (test) {
  var stack = new MinStack()

  stack.push(5)
  test.equal(stack.getMin(), 5)
  test.equal(stack.top(), 5)

  stack.push(10)
  test.equal(stack.getMin(), 5)
  test.equal(stack.top(), 10)

  stack.push(2)
  test.equal(stack.getMin(), 2)
  test.equal(stack.top(), 2)

  stack.pop()
  test.equal(stack.getMin(), 5)
  test.equal(stack.top(), 10)

  stack.pop()
  test.equal(stack.getMin(), 5)
  test.equal(stack.top(), 5)

  stack.pop()

  test.done()
}

module.exports['test2'] = function (test) {

  var stack = new MinStack()
  stack.push(2147483646)
  stack.push(2147483646)
  stack.push(2147483647)
  test.equal(stack.top(), 2147483647)

  stack.pop()
  test.equal(stack.getMin(), 2147483646)

  stack.pop()
  test.equal(stack.getMin(), 2147483646)

  stack.pop()
  
  stack.push(2147483647)
  test.equal(stack.top(), 2147483647)

  test.equal(stack.getMin(), 2147483647)

  stack.push(-2147483648)
  test.equal(stack.top(), -2147483648)
  test.equal(stack.getMin(), -2147483648)
  stack.pop()
  test.equal(stack.getMin(), 2147483647)

  test.done()
}
