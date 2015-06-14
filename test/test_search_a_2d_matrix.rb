require 'minitest/autorun'
require '../search_a_2d_matrix'

describe 'search_matrix' do
  it 'should pass test1' do
    matrix = [
      [1,   3,  5,  7],
      [10, 11, 16, 20],
      [23, 30, 34, 50]
    ]
    target = 3
    search_matrix(matrix, target).must_equal(true)
  end

  it 'should pass test2' do
    matrix = [
      [1,   3,  5,  7],
      [10, 11, 16, 20],
      [23, 30, 34, 50]
    ]
    target = 6
    search_matrix(matrix, target).must_equal(false)
  end

  it 'should pass test3' do
    matrix = [
      [1,   3,  5,  7],
      [10, 11, 16, 20],
      [23, 30, 34, 50]
    ]
    target = 0
    search_matrix(matrix, target).must_equal(false)
  end

  it 'should pass test4' do
    matrix = [
      [1]
    ]
    target = 1
    search_matrix(matrix, target).must_equal(true)
  end

  it 'should pass test5' do
    matrix = [
      [1,3]
    ]
    target = 1
    search_matrix(matrix, target).must_equal(true)
  end
end
