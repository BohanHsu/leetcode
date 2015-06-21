require 'minitest/autorun'
require '../spiral_matrix_ii'

describe 'generate_matrix' do
  it 'shuold work when n = 1' do
    generate_matrix(1).must_equal([[1]])
  end

  it 'shuold work when n = 2' do
    generate_matrix(2).must_equal([[1,2], [4,3]])
  end

  it 'shuold work when n = 3' do
    m = [
      [ 1, 2, 3 ],
      [ 8, 9, 4 ],
      [ 7, 6, 5 ]
    ]
    generate_matrix(3).must_equal(m)
  end

  it 'should work when n = 4' do
    m = [[1,2,3,4],[12,13,14,5],[11,16,15,6],[10,9,8,7]]
    generate_matrix(4).must_equal(m)
  end
end
