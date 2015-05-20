require 'minitest/autorun'
require '../largest_rectangle_in_histogram'

describe 'largest_rectangle_area' do
  #it 'should pass test 1' do
  #  largest_rectangle_area([2,1,5,6,2,3]).must_equal(10)
  #end

  #it 'should pass test 2 empty array' do
  #  largest_rectangle_area([]).must_equal(0)
  #end

  #it 'should pass test 3' do
  #  largest_rectangle_area([1]).must_equal(1)
  #end

  #it 'should pass test 4' do
  #  largest_rectangle_area([1,2,3,4]).must_equal(6)
  #end

  it 'should pass test 5' do
    largest_rectangle_area([9,0]).must_equal(9)
  end

  it 'should pass test 6' do
    largest_rectangle_area([8,9,0]).must_equal(16)
  end
end
