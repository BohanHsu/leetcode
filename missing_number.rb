# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  n = nums.length
  expected_sum = (1 + n) * n / 2
  actual_sum = nums.inject(0) do |memo, obj|
    memo + obj
  end

  expected_sum - actual_sum
end
