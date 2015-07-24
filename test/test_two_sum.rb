require 'minitest/autorun'
require '../two_sum'

describe 'two_sum' do
  it 'should pass test 1' do
    two_sum([2, 7, 11, 15], 9).must_equal([1, 2])
  end

  it 'should pass test 2' do
    two_sum([0, 0, 11, 15], 0).must_equal([1, 2])
  end

  it 'should pass test 3' do
    two_sum([3,2,4], 6).must_equal([2, 3])
  end
end
