require 'minitest/autorun'
require '../the_skyline_problem'

describe 'get_skyline(buildings)' do
  it 'should work' do
    buildings = [[2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8]]
    expected_result = [[2, 10], [3, 15], [7, 12], [12, 0], [15, 10], [20, 8], [24, 0]]
    get_skyline(buildings).must_equal(expected_result)
  end

  it 'should work 1' do
    buildings = [[10,20,30]]
    expected_result = [[10,30], [20,0]]
    get_skyline(buildings).must_equal(expected_result)
  end

  it 'should work 2' do
    buildings = [[0,2147483647,2147483647]]
    expected_result = [[0,2147483647], [2147483647,0]]
    get_skyline(buildings).must_equal(expected_result)
  end
end

describe 'PriorityQueue' do 
  before do
    @buildings = [[2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8]]
    @pq = PriorityQueue.new @buildings

    @pq << 0
    @pq << 3
    @pq << 1
    @pq << 4
    @pq << 2
  end

  it 'should peek' do
    @pq.peek.must_equal(1)
    @pq.delete 1
    @pq.peek.must_equal(2)
  end

  it 'should pop' do
    @pq.pop.must_equal(1)
    @pq.peek.must_equal(2)
  end

  it 'should delete' do
    @pq.delete 2
    @pq.delete 3
    @pq.pop.must_equal(1)
    @pq.pop.must_equal(0)
    @pq.pop.must_equal(4)
    @pq.peek.must_equal(nil)
  end
end
