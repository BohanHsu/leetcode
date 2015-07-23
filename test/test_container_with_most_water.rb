require 'minitest/autorun'
require '../container_with_most_water'

# largest_rectangle_area([2,1,5,6,2,3]).must_equal(10)
describe 'max_area(height)' do
  it 'should work' do
    max_area([2,4,5,6,7,3,2]).must_equal(12)
  end

  it 'should pass corner case' do
    max_area([2, 0]).must_equal(0)
  end

  it 'should work 1' do
    max_area([3,2,1,3]).must_equal(9)
  end

  it 'should work 1' do
    max_area([1,2,4,3]).must_equal(4)
  end

end
