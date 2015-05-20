require 'minitest/autorun'
require '../maximum_product_subarray'

describe 'max_product' do
  it 'should pass test 1' do
    max_product([2,3,-2,4]).must_equal(6)
  end
end
