require 'minitest/autorun'
require '../longest_common_prefix'

describe 'longest_common_prefix(strs)' do
  it 'should work1' do
    strs = [
      'heheh1',
      'heheh2',
      'hehe3',
      'hehe4'
    ]
    prefix = 'hehe'
    longest_common_prefix(strs).must_equal(prefix)
  end

  it 'should work2' do
    strs = [
      'heheh1',
      'heheh2',
      'hehe3',
      'hehe4',
      'heh'
    ]
    prefix = 'heh'
    longest_common_prefix(strs).must_equal(prefix)
  end

  it 'should work3' do
    strs = [
      'heheh1',
      'heheh2',
      'hehe3',
      'hehe4',
      ''
    ]
    prefix = ''
    longest_common_prefix(strs).must_equal(prefix)
  end

  it 'should work4' do
    strs = [
      'heheh1',
      'heheh2'
    ]
    prefix = 'heheh'
    longest_common_prefix(strs).must_equal(prefix)
  end
end
