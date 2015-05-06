require 'minitest/autorun'
require '../maximum_gap'

describe 'maximum_gap' do
  it 'should pass test1' do
    maximum_gap([3,6,9,1]).must_equal(3)
  end

  it 'should pass test2' do
    maximum_gap([1,1,1,1,1,5,5,5,5,5]).must_equal(4)
  end

  it 'should pass test3' do
    maximum_gap([1,100000]).must_equal(99999)
  end
end
