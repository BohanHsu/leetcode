/**
 *  * @param {string} input
 *  * @returns {string[]}
 *  */
var findRepeatedDnaSequences = function(input) {
  var h = {}
  var repeat = []
  for (var i = 0; i < input.length - 10; i++) {
    var substr = input.substring (i, i + 10)
    var hashed_val = hashing_function (substr)
    if (!(hashed_val in h)) {
      h[hashed_val] = true
    } else {
      repeat.push(substr)
    }
  }
  return repeat
};

var hashing_function = function (str) {
  var dict = {
    'A':0,
    'C':1,
    'T':2,
    'G':3
  }

  var base = 1
  var sum = 0
  for (var j = 0; j < str.length; j++) {
    var val = dict[str[j]]
    sum += base * val
    base *= 4
  }

  return sum
}

/* for test purpose */
module.exports['findRepeatedDnaSequences'] = findRepeatedDnaSequences
module.exports['hash_function'] = hashing_function
