require 'minitest/autorun'
require '../reverse_integer'

describe 'reverse(x)' do
  it 'should work' do
    reverse(123).must_equal(321)
    reverse(-123).must_equal(-321)
    reverse(12).must_equal(21)
    reverse(-12).must_equal(-21)
    reverse(0).must_equal(0)
    reverse(1).must_equal(1)
    reverse(-1).must_equal(-1)
    reverse(2).must_equal(2)
  end

  it 'should work 1' do
    reverse(10).must_equal(1)
  end

  it 'should check overflow' do
    reverse(1534236469).must_equal(0)
    reverse(1563847412).must_equal(0)
  end
end
