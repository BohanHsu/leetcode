require 'minitest/autorun'
require '../subsets'

describe 'subsets' do
  it 'should pass test 1' do
    nums = [1,2,3]

    expected_result = [
      [3],
      [1],
      [2],
      [1,2,3],
      [1,3],
      [2,3],
      [1,2],
      []
    ].sort!
    result = subsets(nums)
    result.sort!.must_equal(expected_result)
  end

  it 'should pass test 2' do
    nums = []
  end

  it 'should sort???' do
    nums = [4,1,0]
    expected_result = [[],[4],[1],[1,4],[0],[0,4],[0,1],[0,1,4]]
    result = subsets(nums)
    result.must_equal(expected_result)
  end


end
