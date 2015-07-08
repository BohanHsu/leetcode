require 'minitest/autorun'
require '../search_for_a_range'

describe 'binary_search(nums, target, f, t)' do

  it 'should pass test 1' do
    binary_search([1,3,5,6], 5, 0, 4).must_equal(2)
  end

  it 'should pass test 2' do
    binary_search([1,3,5,6], 2, 0, 4).must_equal(nil)
  end

  it 'should pass test 3' do
    binary_search([1,3,5,6], 7, 0, 4).must_equal(nil)
  end

  it 'should pass test 4' do
    binary_search([1,3,5,6], 0, 0, 4).must_equal(nil)
  end

  it 'should pass corner case 1' do
    binary_search([], 1, 0, 0).must_equal(nil)
  end
  
  it 'should pass corner case 2' do
    binary_search([2], 2, 0, 1).must_equal(0)
  end

  it 'should pass corner case 3' do
    binary_search([0], 1, 0, 1).must_equal(nil)
  end

  it 'should work 1' do
    binary_search([1,3], 3, 0, 2).must_equal(1)
  end
end

describe 'search_range(nums, target)' do
  #it 'should work' do
  #  search_range([5, 7, 7, 8, 8, 10], 8).must_equal([3,4])
  #  search_range([5, 7, 7, 8, 8, 10], 7).must_equal([1,2])
  #  search_range([5, 7, 7, 8, 8, 10], 1).must_equal([-1,-1])
  #end

  it 'should work 1' do
    search_range([2, 2], 2).must_equal([0,1])
  end
end
