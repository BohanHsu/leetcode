rwias = require('../reverse_words_in_a_string')
reverseWords = rwias['reverseWords']

module.exports['test1'] = function (test) {
  var str = "the sky is blue"
  test.equal(reverseWords(str), "blue is sky the")
  test.done()
}

module.exports['test 2'] = function (test) {
  var str = " "
  test.equal(reverseWords(str), "")
  test.done()
}

module.exports['test 3'] = function (test) {
  var str = "     "
  test.equal(reverseWords(str), "")
  test.done()
}
