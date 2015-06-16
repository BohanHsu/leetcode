require 'minitest/autorun'
require '../climbing_stairs'

describe 'climb_stairs' do
  it 'should work when n == 1' do
    climb_stairs(1).must_equal(1)
  end

  it 'should work when n == 2' do
    climb_stairs(2).must_equal(2)
  end

  it 'should work when n == 3' do
    climb_stairs(3).must_equal(3)
  end

  it 'should work when n == 4' do
    climb_stairs(4).must_equal(5)
  end

  it 'should work when n == 5' do
    climb_stairs(5).must_equal(8)
  end
end

describe 'combinations' do
  it 'should pass test0' do
    combinations(6,0).must_equal(1)
  end

  it 'should pass test1' do
    combinations(6,1).must_equal(6)
  end

  it 'should pass test2' do
    combinations(6,2).must_equal(15)
  end

  it 'should pass test3' do
    combinations(6,3).must_equal(20)
  end
end
