/**
 * @param {number[]} num
 * @return {string}
 */
var largestNumber = function(num) {
  var filtered = num.filter(function (elem) {
    return elem === 0 ? false : true
  })

  if (filtered.length === 0) {
    return '0'
  }

  num = num.map(function (elem) {
    return elem.toString()
  })

  num.sort(function (num_str1, num_str2) {
    var num_concat1 = parseInt(num_str1 + num_str2)
    var num_concat2 = parseInt(num_str2 + num_str1)

    if (num_concat1 == num_concat2) {
      return 0
    } else {
      return num_concat1 >= num_concat2 ? -1 : 1
    }
  })

  return num.join('')
};

module.exports = largestNumber
