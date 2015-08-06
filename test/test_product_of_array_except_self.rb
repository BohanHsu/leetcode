require 'minitest/autorun'
require '../product_of_array_except_self'

describe 'product_except_self(nums)' do
  it 'should work' do
    arr = [1,2,3,4]
    expected_result = [24,12,8,6]
    product_except_self(arr).must_equal(expected_result)
  end
end
