require 'minitest/autorun'
require '../permutations_ii'

describe 'permute_unique' do 
  it 'should work' do
    expected_result = [
      [1,1,2], 
      [1,2,1],
      [2,1,1]
    ]
    permute_unique([1,1,2]).must_equal(expected_result)
  end
end
