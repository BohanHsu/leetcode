require 'minitest/autorun'
require '../maximum_subarray'

describe 'max_sub_array' do
  it 'should work' do
    max_sub_array([-2,1,-3,4,-1,2,1,-5,4]).must_equal(6)
  end

  it 'should return maximum negative value in array when no positive value' do
    max_sub_array([-1]).must_equal(-1)
  end
end
