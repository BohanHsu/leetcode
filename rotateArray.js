/**
 * @param {number[]} nums
 * @param {number} k
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var rotate = function(nums, k) {
  var len = nums.length
  k = k % len
  tmp = new Array(k)
  for (i = 0; i < k; i++) {
    tmp[i] = nums[len - k + i]
  }
  for (i = 0; i < len - k; i++) {
    nums[len - 1 - i] = nums[len - k - 1 - i]
  }
  for (i = 0; i < k; i++) {
    nums[i] = tmp[i]
  }

  /* for test purpose */
  return nums
};

/* for test purpose */
module.exports = rotate
