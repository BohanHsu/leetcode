require 'minitest/autorun'
require '../sliding_window_maximum'

describe 'Deque' do
  before do
    @dq = Deque.new
    @dq << 1
    @dq << 2
    @dq << 3
    @dq << 4
    @dq << 5
  end

  it 'should peek left' do
    @dq.peek_left.must_equal(1)
  end

  it 'should peek right' do
    @dq.peek_right.must_equal(5)
  end

  it 'should pop left' do
    @dq.pop_left.must_equal(1)
    @dq.pop_left.must_equal(2)
    @dq.peek_left.must_equal(3)
  end

  it 'should pop right' do
    @dq.pop_right.must_equal(5)
    @dq.pop_right.must_equal(4)
    @dq.peek_right.must_equal(3)
  end

  it 'should check empty' do
    @dq.empty?.must_equal(false)
    @dq.pop_right
    @dq.pop_right
    @dq.pop_right
    @dq.pop_right
    @dq.pop_right
    @dq.empty?.must_equal(true)
  end

  it 'should check empty1' do
    @dq.empty?.must_equal(false)
    @dq.pop_left
    @dq.pop_left
    @dq.pop_left
    @dq.pop_left
    @dq.pop_left
    @dq.empty?.must_equal(true)
  end

  it 'should work' do
    @dq.empty?.must_equal(false)
    @dq.pop_left
    @dq.pop_left
    @dq.pop_left
    @dq.pop_left
    @dq.pop_left
    @dq << 6
    @dq.peek_left.must_equal(6)
    @dq.peek_right.must_equal(6)
  end
end

describe 'max_sliding_window(nums, k)' do
  it 'should pass provided test' do
    nums = [1,3,-1,-3,5,3,6,7]
    k = 3
    expected_result = [3,3,5,5,6,7]
    max_sliding_window(nums, k).must_equal(expected_result)
  end

  it 'should pass corner case' do
    nums = [1]
    k = 1
    expected_result = [1]
    max_sliding_window(nums, k).must_equal(expected_result)

    nums = []
    k = 0
    expected_result = []
    max_sliding_window(nums, k).must_equal(expected_result)
  end

  it 'should work' do
    nums = [1,-1]
    k = 1
    expected_result = [1,-1]
    max_sliding_window(nums, k).must_equal(expected_result)
  end
end
