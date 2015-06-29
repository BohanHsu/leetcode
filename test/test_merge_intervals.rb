require 'minitest/autorun'
require '../merge_intervals'

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


describe 'merge' do
  it 'should work on provided test case' do
    i_to_a(merge(a_to_i([[1,3],[2,6],[8,10],[15,18]]))).must_equal([[1,6],[8,10],[15,18]])
  end
end
