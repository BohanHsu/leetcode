require 'minitest/autorun'
require '../spiral_matrix'

describe 'Iterator.next_coordinate' do
  it 'should work on 3 * 3 matrix' do
    matrix = [
      [ 1, 2, 3 ],
      [ 4, 5, 6 ],
      [ 7, 8, 9 ]
    ]
    i = Iterator.new matrix, 3, 3, 0, 0

    i.has_next?.must_equal(true)
    i.next_coordinate.must_equal([0,0])
    i.has_next?.must_equal(true)
    i.next_coordinate.must_equal([0,1])
    i.has_next?.must_equal(true)
    i.next_coordinate.must_equal([0,2])
    i.has_next?.must_equal(true)
    i.next_coordinate.must_equal([1,2])
    i.has_next?.must_equal(true)
    i.next_coordinate.must_equal([2,2])
    i.has_next?.must_equal(true)
    i.next_coordinate.must_equal([2,1])
    i.has_next?.must_equal(true)
    i.next_coordinate.must_equal([2,0])
    i.has_next?.must_equal(true)
    i.next_coordinate.must_equal([1,0])
    i.has_next?.must_equal(false)
  end

  it 'should work on 4 * 4 matrix' do
    matrix = [
      [1,2,3,4],
      [12,0,0,5],
      [11,0,0,6],
      [10,9,8,7]
    ]

    i = Iterator.new matrix, 4, 4, 0, 0

    i.next_coordinate.must_equal([0,0])
    i.next_coordinate.must_equal([0,1])
    i.next_coordinate.must_equal([0,2])
    i.next_coordinate.must_equal([0,3])
    i.next_coordinate.must_equal([1,3])
    i.next_coordinate.must_equal([2,3])
    i.next_coordinate.must_equal([3,3])
    i.next_coordinate.must_equal([3,2])
    i.next_coordinate.must_equal([3,1])
    i.next_coordinate.must_equal([3,0])
    i.next_coordinate.must_equal([2,0])
    i.next_coordinate.must_equal([1,0])
    i.has_next?.must_equal(false)
  end

  it 'should work with 1 * 2 and 2 * 1 matrix' do
    m1 = [[1,2]]
    m2 = [
      [1],
      [2]
    ]

    i1 = Iterator.new m1, 2, 1, 0, 0
    i2 = Iterator.new m2, 1, 2, 0, 0

    i1.next_coordinate.must_equal([0,0])
    i1.next_coordinate.must_equal([0,1])
    i1.has_next?.must_equal(false)

    i2.next_coordinate.must_equal([0,0])
    i2.next_coordinate.must_equal([1,0])
    i2.has_next?.must_equal(false)

    m3 = [
      [1],
      [3],
      [2]
    ]
    i3 = Iterator.new m3, 1, 3, 0, 0
    i3.next_coordinate.must_equal([0,0])
    i3.next_coordinate.must_equal([1,0])
    i3.next_coordinate.must_equal([2,0])
    i3.has_next?.must_equal(false)
  end

  it 'should work with 2 * 2' do
    matrix = []
    i = Iterator.new matrix, 2, 2, 1, 1
    i.next_coordinate.must_equal([1,1])
    i.next_coordinate.must_equal([1,2])
    i.next_coordinate.must_equal([2,2])
    i.next_coordinate.must_equal([2,1])
  end
end

describe 'Iterator.next' do
  it 'should work on 3 * 3 matrix' do
    matrix = [
      [ 1, 2, 3 ],
      [ 4, 5, 6 ],
      [ 7, 8, 9 ]
    ]
    i = Iterator.new matrix, 3, 3, 0, 0

    i.has_next?.must_equal(true)
    i.next.must_equal(1)
    i.has_next?.must_equal(true)
    i.next.must_equal(2)
    i.has_next?.must_equal(true)
    i.next.must_equal(3)
    i.has_next?.must_equal(true)
    i.next.must_equal(6)
    i.has_next?.must_equal(true)
    i.next.must_equal(9)
    i.has_next?.must_equal(true)
    i.next.must_equal(8)
    i.has_next?.must_equal(true)
    i.next.must_equal(7)
    i.has_next?.must_equal(true)
    i.next.must_equal(4)
    i.has_next?.must_equal(false)
  end
end

describe 'spiral_order' do
  it 'should pass test 1' do
    matrix = [
      [ 1, 2, 3 ],
      [ 4, 5, 6 ],
      [ 7, 8, 9 ]
    ]
    spiral_order(matrix).must_equal([1,2,3,6,9,8,7,4,5])
  end

  it 'should pass test 2' do
    matrix = [
      [1],
      [4],
      [7]
    ]
    spiral_order(matrix).must_equal([1,4,7])
  end

  it 'should pass test 3' do
    matrix = []
    spiral_order(matrix).must_equal([])
  end

  it 'should pass test 4' do
    matrix = [
      [1,2,3,4],
      [5,6,7,8],
      [9,10,11,12],
      [13,14,15,16]
    ]
    spiral_order(matrix).must_equal([1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10])
  end
end
