require 'minitest/autorun'
require '../combination_sum_iii'

describe 'combination_sum3(k, n)' do
  it 'should work' do
    k, n = 3, 7
    expected_result = [[1, 2, 4]].sort
    combination_sum3(k, n).sort.must_equal(expected_result)

    k, n = 3, 9
    expected_result = [[1,2,6], [1,3,5], [2,3,4]].sort
    combination_sum3(k, n).sort.must_equal(expected_result)
  end
end
