require 'minitest/autorun'
require '../maximal_square'

describe 'maximal_square_in_line(line)' do
  it 'should work' do
    line = []
    square = 0
    maximal_square_in_line(line).must_equal(square)

    line = [1,2,3,4,5]
    square = 9
    maximal_square_in_line(line).must_equal(square)
  end
end

describe 'maximal_square(matrix)' do
  it 'should work 1' do
    matrix = [
      ['0', '0', '0', '0', '0', '0'],
      ['0', '1', '1', '0', '0', '0'],
      ['0', '1', '1', '0', '0', '0'],
      ['0', '1', '0', '1', '1', '1'],
      ['0', '0', '1', '1', '1', '1'],
      ['0', '1', '1', '1', '1', '1']
    ]
    area = 9
    maximal_square(matrix).must_equal(area)
  end

  it 'should work 2' do
    matrix = [
      ['0', '0', '0', '0', '0', '0'],
      ['0', '1', '1', '0', '0', '0'],
      ['0', '1', '1', '1', '1', '1'],
      ['0', '1', '1', '1', '1', '1'],
      ['0', '0', '1', '1', '1', '1'],
      ['0', '1', '1', '1', '1', '1']
    ]
    area = 16
    maximal_square(matrix).must_equal(area)
  end

  it 'should work in corner case' do
    matrix = []
    area = 0
    maximal_square(matrix).must_equal(area)

    matrix = [[], []]
    area = 0
    maximal_square(matrix).must_equal(area)
  end
end
