require 'minitest/autorun'
require '../add_digits'

describe 'add_digits_helper(num)' do
  it 'should work' do
    num = 38
    expected_result = 2
    add_digits_helper(num).must_equal(expected_result)
  end

  it 'should help' do
    #30.times do |i|
    #  p "i=#{i}, sum=#{add_digits_helper(i)}"
    #end
  end
end

describe 'add_digits(num)' do
  it 'should return same value as help method' do
    1000.times do |i|
      expected_result = add_digits_helper(i)
      add_digits(i).must_equal(expected_result)
    end
  end
end
