require 'minitest/autorun'
require '../house_robber'

describe 'rob(nums)' do
  it 'should work 1' do
    rob([1,2,3,4]).must_equal(6)
    rob([1,2,3,4,1]).must_equal(6)
    rob([1,2,3,4,3]).must_equal(7)
  end

  it 'should work 2' do
    rob([2,1,1,2]).must_equal(4)
  end
end
