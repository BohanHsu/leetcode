require 'minitest/autorun'
require '../rectangle_area'

describe 'union_area(a, b, c, d, e, f, g, h)' do
  it 'should work' do
    a, b, c, d, e, f, g, h = -3, 0, 3, 4, 0, -1, 9, 2
    area = 6
    union_area(a, b, c, d, e, f, g, h).must_equal(area)
  end

  it 'should work1' do
    a, b, c, d, e, f, g, h = -3, 0, 3, 4, 5, -1, 9, 2
    area = 0
    union_area(a, b, c, d, e, f, g, h).must_equal(area)
  end
end

describe 'compute_area' do
  it 'should work' do
    a, b, c, d, e, f, g, h = -3, 0, 3, 4, 0, -1, 9, 2
    area = 45
    compute_area(a, b, c, d, e, f, g, h).must_equal(area)
  end
end
