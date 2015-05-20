require 'minitest/autorun'
require '../find_minimum_in_rotated_sorted_array_ii'

describe 'find_min' do
  it 'should pass test1' do
    find_min([4, 5, 6, 7, 0, 1, 2]).must_equal(0)
  end

  it 'should work with one element' do
    find_min([1]).must_equal(1)
  end

  it 'should work with two element' do
    find_min([1, 2]).must_equal(1)
  end

  it 'should work with three element' do
    find_min([1, 2, 3]).must_equal(1)
  end

  it 'shold work with duplicate elements 1' do
    find_min([1,2,2,2,2,2,2]).must_equal(1)
  end

  it 'shold work with duplicate elements 2' do
    find_min([1,2,2,2,2,2,2,1,1,1,1,1,1,1]).must_equal(1)
  end
end
