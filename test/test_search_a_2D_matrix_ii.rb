require 'minitest/autorun'
require '../search_a_2D_matrix_ii'

describe 'search_matrix(matrix, target)' do
  it 'should work' do
    matrix = [
      [1,   4,  7, 11, 15],
      [2,   5,  8, 12, 19],
      [3,   6,  9, 16, 22],
      [10, 13, 14, 17, 24],
      [18, 21, 23, 26, 30]
    ]
    target = 5
    res = true
    search_matrix(matrix, target).must_equal(res)

    matrix = [
      [1,   4,  7, 11, 15],
      [2,   5,  8, 12, 19],
      [3,   6,  9, 16, 22],
      [10, 13, 14, 17, 24],
      [18, 21, 23, 26, 30]
    ]
    target = 20
    res = false
    search_matrix(matrix, target).must_equal(res)
  end
end
