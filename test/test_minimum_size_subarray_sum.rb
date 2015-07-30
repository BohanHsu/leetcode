require 'minitest/autorun'
require '../minimum_size_subarray_sum'

describe 'min_sub_array_len(s, nums)' do
  it 'should work' do
    nums = [2,3,1,2,4,3]
    s = 7
    min_sub_array_len(s, nums).must_equal(2)
  end

  it 'should work 1' do
    nums = [2,3,1,2,4,3]
    s = 16
    min_sub_array_len(s, nums).must_equal(0)
  end

  it 'should work 2' do
    nums = [1,2,3,4,5]
    s = 11
    min_sub_array_len(s, nums).must_equal(3)
  end
end
