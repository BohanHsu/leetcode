require 'minitest/autorun'
require '../minimum_path_sum'

describe 'min_path_sum' do
  it 'should pass test 1' do
    grid = [
      [1,2,3],
      [1,1,3],
      [1,2,1]
    ]
    min_path_sum(grid).must_equal(6)
  end
end
