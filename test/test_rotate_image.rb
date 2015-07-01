require 'minitest/autorun'
require '../rotate_image'

describe 'rotate' do
  it 'should work when n == 5' do
    @matrix = 5.times.map do
      5.times.map do
        nil
      end
    end

    @matrix[1][0] = 1
    @matrix[0][3] = 2
    @matrix[3][4] = 3
    @matrix[4][1] = 4

    rotate(@matrix)

    @matrix[1][0].must_equal(4)
    @matrix[0][3].must_equal(1)
    @matrix[3][4].must_equal(2)
    @matrix[4][1].must_equal(3)
  end

  it 'should work when n == 1' do
    @matrix = [[1]]

    rotate(@matrix)

    @matrix[0][0].must_equal(1)
  end

  it 'should work when n == 2' do
    @matrix = [
      [1,2],
      [3,4]
    ]

    rotate(@matrix)

    @matrix.must_equal([
                       [3,1],
                       [4,2]
    ])
  end

  it 'should work when n == 3' do
    @matrix = [
      [1,2,3],
      [4,5,6],
      [7,8,9]
    ]

    rotate(@matrix)

    @matrix.must_equal([
                               [7, 4, 1],
                               [8, 5, 2],
                               [9, 6, 3]
    ])
  end
end
