require 'minitest/autorun'
require '../house_robber_ii'

describe 'rob(nums)' do
  it 'should work when house num < 4' do
    nums = [1]
    rob(nums).must_equal(nums.max)
    nums = [3]
    rob(nums).must_equal(nums.max)
  end

  it 'should work when house num >= 4' do
    nums = [1,2,3,4]
    rob(nums).must_equal(6)
  end

  it 'should work when house num >= 4' do
    nums = [1,2,3,4,5]
    rob(nums).must_equal(8)
  end

  it 'should work 1' do
    nums = [1,3,1,3,100]
    rob(nums).must_equal(103)
  end
end
