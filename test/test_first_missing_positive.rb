require 'minitest/autorun'
require '../first_missing_positive'

describe 'first_missing_positive(nums)' do
  it 'should guide development' do
    first_missing_positive([3,4,-1,5,6,15,30]).must_equal(1)
  end

  it 'should work1' do
    first_missing_positive([3,4,-1,1]).must_equal(2)
  end

  it 'should work2' do
    first_missing_positive([1,2,0]).must_equal(3)
  end

  it 'should work3' do
    first_missing_positive([1,2,3]).must_equal(4)
  end

  it 'should work4' do
    first_missing_positive([2,1,3]).must_equal(4)
  end

  it 'should work5' do
    first_missing_positive([]).must_equal(1)
  end
end
