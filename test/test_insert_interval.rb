require 'minitest/autorun'
require '../insert_interval'

# Definition for an interval.
class Interval
  attr_accessor :start, :end
  def initialize(s=0, e=0)
      @start = s
      @end = e
  end

  def ==(o)
    return @start == o.start && @end == o.end
  end
end

def itl(s,e)
  Interval.new s, e
end

def i_to_a(ia)
  ia.map do |interval|
    [interval.start, interval.end]
  end
end

def a_to_i(a)
  a.map do |array|
    itl(array.first, array.last)
  end
end

describe 'i_to_a' do
  it 'should work' do
    i = [itl(1,2), itl(3,4)]
    a = i_to_a(i)
    a.must_equal [[1,2],[3,4]]
  end
end

describe 'a_to_i' do
  it 'should work' do
    a = [[1,2],[3,4]]
    i = a_to_i a
    i.must_equal [itl(1,2), itl(3,4)]
  end
end

describe 'insert' do
  it 'should guide development' do
    i_to_a(insert(a_to_i([[1,2],[5,6]]), itl(3,4))).must_equal([[1,2],[3,4],[5,6]])
  end

  it 'should work when start in left and end in left' do
    i_to_a(insert(a_to_i([[10,20],[50,60]]), itl(3,4))).must_equal([[3,4],[10,20],[50,60]])
  end

  it 'should work when start in right and end in right' do
    i_to_a(insert(a_to_i([[10,20],[50,60]]), itl(70,80))).must_equal([[10,20],[50,60], [70, 80]])
  end

  it 'should work when start in middle and end in bewteen' do
    i_to_a(insert(a_to_i([[10,20],[30,40],[50,60]]), itl(15,45))).must_equal([[10,45],[50,60]])
  end

  it 'should work when start in between and end in middle' do
    i_to_a(insert(a_to_i([[10,20],[30,40],[50,60]]), itl(25,55))).must_equal([[10,20],[25,60]])
  end

  it 'should work when start in middle and end in middle' do
    i_to_a(insert(a_to_i([[10,20],[30,40],[50,60]]), itl(15,55))).must_equal([[10,60]])
  end

  it 'should work when intervals is empty' do
    i_to_a(insert(a_to_i([]), itl(15,55))).must_equal([[15,55]])
  end

  it 'should work when intervals has one element' do
    i_to_a(insert(a_to_i([[1,5]]), itl(2,3))).must_equal([[1,5]])
  end
end
