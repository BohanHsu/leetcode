require 'minitest/autorun'
require '../missing_number'

describe 'missing_number(nums)' do
  it 'should work1' do
    nums = [0,1,3]
    expected_result = 2
    missing_number(nums).must_equal(expected_result)
  end

  it 'should work2' do
    nums = [0,4,1,3]
    expected_result = 2
    missing_number(nums).must_equal(expected_result)
  end

  it 'should work3' do
    nums = [2,4,1,3]
    expected_result = 0
    missing_number(nums).must_equal(expected_result)
  end
end
