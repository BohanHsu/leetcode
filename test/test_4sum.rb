require 'minitest/autorun'
require '../4sum'

describe 'four_sum(nums, target)' do
  it 'should work' do
    nums = [1,0,-1,0,-2,2]
    target = 0
    expected_result = [
      [-1,  0, 0, 1],
      [-2, -1, 1, 2],
      [-2,  0, 0, 2]
    ]

    four_sum(nums, target).sort.must_equal(expected_result.sort)
  end

  it 'should work 1' do
    nums = [0,0,0,0]
    target = 0
    expected_result = [
      [0, 0, 0, 0]
    ]

    four_sum(nums, target).sort.must_equal(expected_result.sort)
  end
end
