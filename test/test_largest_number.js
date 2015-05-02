var largestNumber = require('../largest_number')

exports['test1'] = function (test) {
  var nums = [3, 30, 34, 5, 9]
  var res = "9534330"
  test.equal(largestNumber(nums), res)
  test.done()
}

exports['test2'] = function (test) {
  var nums = [0, 0]
  var res = "0"
  test.equal(largestNumber(nums), res)
  test.done()
}
