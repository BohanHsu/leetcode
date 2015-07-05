require 'minitest/autorun'
require '../combination_sum_ii'

describe 'combination_sum2(candidates, target)' do
  it 'should work' do
    combinations = [10,1,2,7,6,1,5]
    expected_result = [
      [1, 7],
      [1, 2, 5],
      [2, 6],
      [1, 1, 6] 
    ].sort
    combination_sum2(combinations, 8).sort.must_equal(expected_result)
  end
end
