require 'minitest/autorun'
require '../bitwise_AND_of_numbers_range'

describe 'range_bitwise_and(m, n)' do
  it 'should work' do
    range_bitwise_and(5, 7).must_equal(4)
  end
end
