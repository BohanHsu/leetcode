/**
 * @param {number} n - a positive integer
 * @return {number} - a positive integer
 */
var reverseBits = function(n) {
  var remainder = n % 2
  var quotient = (n - remainder) / 2
  var bits = []
  while (n !== 0) {
    bits.push(remainder)
    n = quotient
    remainder = n % 2
    quotient = (n - remainder) / 2
  }

  var len = bits.length
  var base = Math.pow(2, (32 - len))
  var sum = 0

  for (i = 0; i < len; i++) {
    sum += (bits[len - 1 - i] * base)
    base *= 2
  }

  return sum
};

/* for test purpose */
module.exports = reverseBits
