var test_funct = require('../numberof1Bits')

exports['test hammingWeight 11'] = function (test) {
  test.equal(test_funct(11), 3)
  test.done()
}

exports['test hammingWeight 0'] = function (test) {
  test.equal(test_funct(0), 0)
  test.done()
}
