require 'minitest/autorun'
require '../permutations'

describe 'permute' do 
  it 'should work' do
    expected_result = [
      [1,2,3], 
      [1,3,2], 
      [2,1,3], 
      [2,3,1], 
      [3,1,2],
      [3,2,1]
    ]
    permute([1,2,3]).must_equal(expected_result)
  end
end
