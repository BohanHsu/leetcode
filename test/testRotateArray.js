var test_funct = require('../rotateArray')

exports['test 1'] = function (test) {
  test.deepEqual(test_funct([1,2,3], 2), [2,3,1])
  test.done()
}

exports['test 2'] = function (test) {
  var nums = [1,2,3,4,5,6,7]
  test.deepEqual(test_funct(nums, 3), [5,6,7,1,2,3,4])
  test.done()
}

exports['test 3'] = function (test) {
  var nums = [-1]
  test.deepEqual(test_funct(nums, 2), [-1])
  test.done()
}
