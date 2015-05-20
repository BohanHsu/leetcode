/**
 * @param {string} str
 * @returns {string}
 */
var reverseWords = function(str) {
  var array = str.split(" ")
  array = array.filter(function (elem) {
    return !(elem === " " || elem === "")
  })
  array.reverse()
  str = array.join(" ")
  return str
};

module.exports['reverseWords'] = reverseWords
