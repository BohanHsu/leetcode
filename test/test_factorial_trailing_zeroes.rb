require 'minitest/autorun'
require '../factorial_trailing_zeroes'

describe 'trailing zeros' do
  it 'should calculate 23 have 4' do
    trailing_zeroes(23).must_equal(4)
  end

  it 'should calculate 101 have 24' do
    trailing_zeroes(101).must_equal(24)
  end

  it 'should calculate 1000 have 249' do
    trailing_zeroes(1000).must_equal(249)
  end
end
