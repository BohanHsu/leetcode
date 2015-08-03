require 'minitest/autorun'
require '../power_of_two'

describe 'is_power_of_two(n)' do
  it 'should return true' do
    n = 1
    res = true
    is_power_of_two(n).must_equal(res)

    n = 2
    res = true
    is_power_of_two(n).must_equal(res)

    n = 64
    res = true
    is_power_of_two(n).must_equal(res)
  end

  it 'should return false' do
    n = 3
    res = false
    is_power_of_two(n).must_equal(res)

    n = 63
    res = false
    is_power_of_two(n).must_equal(res)
  end
end
