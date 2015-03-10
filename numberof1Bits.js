/**
 * @param {number} n - a positive integer
 * @return {number}
 */
var hammingWeight = function(n) {
  count = 0
  remainder = n % 2
  quotient = (n - remainder) / 2
  while (n != 0) {
    if (remainder == 1) {
      count++
    }
    n = quotient
    remainder = n % 2
    quotient = (n - remainder) / 2
  }
  return count
};

/* for test purpose */
module.exports = hammingWeight
