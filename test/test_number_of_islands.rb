require 'minitest/autorun'
require '../number_of_islands'

describe 'num_islands(grid)' do
  it 'should work 1' do
    grid = [
      %w(1 1 1 1 0),
      %w(1 1 0 1 0),
      %w(1 1 0 0 0),
      %w(0 0 0 0 0)
    ]
    expected_result = 1

    num_islands(grid).must_equal(expected_result)
  end

  it 'should work 2' do
    grid = [
      %w(1 1 0 0 0),
      %w(1 1 0 0 0),
      %w(0 0 1 0 0),
      %w(0 0 0 1 1)
    ]
    expected_result = 3

    num_islands(grid).must_equal(expected_result)
  end
end
