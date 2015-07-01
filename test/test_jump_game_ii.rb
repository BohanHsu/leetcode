require 'minitest/autorun'
require '../jump_game_ii'

describe 'jump' do
  it 'should work' do
    jump([2,3,1,1,4]).must_equal(2)
  end

  it 'should work 2' do
    jump([1,3,2]).must_equal(2)
  end

  it 'should work 3' do
    jump([1,2,0,1]).must_equal(2)
  end

  it 'should work 4' do
    jump([0]).must_equal(0)
  end
end
