require 'minitest/autorun'
require '../plus_one'

describe 'plus_one' do
  it 'should work for 1' do
    plus_one([1]).must_equal([2])
  end

  it 'should work for 9' do
    plus_one([9]).must_equal([1,0])
  end

  it 'should work for 99' do
    plus_one([9,9]).must_equal([1,0,0])
  end
end
