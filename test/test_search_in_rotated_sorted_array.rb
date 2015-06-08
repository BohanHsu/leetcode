require 'minitest/autorun'
require '../search_in_rotated_sorted_array'

describe 'search' do
  it 'should pass test1' do
    search([4,5,6,7,0,1,2], 6).must_equal(2)
  end

  it 'should pass test2' do
    search([4,5,6,7,0,1,2], 3).must_equal(-1)
  end

  it 'should pass test3' do
    search([4,5,6,7,0,1,2,3], 3).must_equal(7)
  end

  it 'should pass test4' do
    search([4,5,6,7,0,1,2,3], 8).must_equal(-1)
  end

  it 'should pass test5' do
    search([0], 0).must_equal(0)
  end

  it 'should pass test6' do
    search([0], 1).must_equal(-1)
  end

  it 'should pass test7' do
    search([0,1], 1).must_equal(1)
  end

  it 'should pass test8' do
    search([0,1], 0).must_equal(0)
  end

  it 'should pass test9' do
    search([0,1], 2).must_equal(-1)
  end
end
