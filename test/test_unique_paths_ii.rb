require 'minitest/autorun'
require '../unique_paths_ii'

describe 'unique_paths_with_obstacles' do
  it 'should pass provided test1' do
    grid = [
      [0,0,0],
      [0,1,0],
      [0,0,0]
    ]
    unique_paths_with_obstacles(grid).must_equal(2)
  end
end
