var bttbass = require('../bestTimeToBuyAndSellStock')
minIndex = bttbass.minIndex
maxIndex = bttbass.maxIndex
maxProfit = bttbass.maxProfit

exports['test minIndex'] = function (test) {
  var prices = [2,3,5,3,0,3,4]
  test.equal(minIndex(prices, 0, prices.length), 4)
  test.equal(minIndex(prices, 0, 4), 0)
  test.done()
}

exports['test maxIndex'] = function (test) {
  var prices = [2,3,5,3,0,3,4]
  test.equal(maxIndex(prices, 0, prices.length), 2)
  test.equal(maxIndex(prices, 3, prices.length), 6)
  test.done()
}

exports['test maxProfit'] = function (test) {
  var p1 = [2,3,5,3,0,3,4]
  test.equal(maxProfit(p1), 4)

  var p2 = [1,0,1,4,0]
  test.equal(maxProfit(p2), 4)

  var p3 = [4,2,3,1]
  test.equal(maxProfit(p3), 1)

  test.done()
}

exports['test1'] = function (test) {
  var p = [1,1,0]
  test.equal(maxProfit(p), 0)
  test.done()
}

exports['test2'] = function (test) {
  var p = [1,1,0]
  test.equal(maxIndex(p, 2, 3), 2)

  test.done()
}

exports['test3'] = function (test) {
  var p = [1,1,0]
  test.equal(maxProfit(p), 0)

  test.done()
}
