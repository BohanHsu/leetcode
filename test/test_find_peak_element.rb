require 'minitest/autorun'
require '../find_peak_element'

describe 'find_peak_element' do
  it 'should pass test1' do
    find_peak_element([80,60,40,20,10]).must_equal(0)
  end

  it 'should pass test2' do
    find_peak_element([10]).must_equal(0)
  end

  it 'should pass test3' do
    find_peak_element([10, 2]).must_equal(0)
  end

  it 'should pass test4' do
    find_peak_element([10, 20]).must_equal(1)
  end

  it 'should pass test2' do
    find_peak_element([20,60,40,20,10]).must_equal(1)
  end
end
