require 'minitest/autorun'
require '../combination_sum'

describe 'combination_sum(candidates, target)' do
  #it 'guide development' do
  #  combination_sum([1,2], 3)
  #end

  it 'should work' do
    candidates = [2,3,6,7]
    expected_results = [
      [7], 
      [2,2,3]
    ]
    combination_sum(candidates, 7).must_equal(expected_results)
  end
end
