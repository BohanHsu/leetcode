require 'minitest/autorun'
require '../ugly_number'

describe 'is_ugly(num)' do
  it 'should work' do
    ugly_numbers = {
      1 => true,
      2 => true,
      3 => true,
      4 => true,
      5 => true,
      6 => true,
      7 => false,
      8 => true,
      9 => true,
      10 => true,
      11 => false,
      12 => true,
      13 => false,
      14 => false
    }

    ugly_numbers.each do |num, expected_result|
      is_ugly(num).must_equal(expected_result)
    end
  end
end
