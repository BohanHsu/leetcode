require 'minitest/autorun'
require '../number_of_digit_one'

def confirm_n(n)
  count = 0
  (0..n).each do |i|
    while i > 0 do
      digit = i % 10
      i /= 10
      count += 1 if digit == 1
    end
  end
  count
end

describe 'confirm_n(n)' do
  it 'should work fine' do
    confirm_n(13).must_equal(6)
  end
end

describe 'dict(n)' do
  it 'should work fine' do
    (0..99).each do |i|
      dict(i).must_equal(confirm_n(i))
    end
  end
end

describe 'count_digit_one(n)' do
  it 'should work' do
    n = 1000
    count_digit_one(n).must_equal(confirm_n(n))
  end

  it 'should work fine' do
    (0..10000).each do |n|
      count_digit_one(n).must_equal(confirm_n(n))
    end
  end
end
