var test_funct = require('../reverseBits')

exports['test 1'] = function (test) {
 test.equal(test_funct(43261596), 964176192)
 test.done()
}

exports['test 2'] = function (test) {
 test.equal(test_funct(0), 0)
 test.done()
}
