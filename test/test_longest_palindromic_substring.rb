require 'minitest/autorun'
require '../longest_palindromic_substring'

describe 'longest_palindrome' do
  it 'should pass test when empty str' do
    longest_palindrome('').must_equal(0)
  end
  
  it 'should pass test when only one char' do
    longest_palindrome('i').must_equal(1)
  end

  it 'should pass test 1' do
    longest_palindrome('sabag').must_equal(3)
  end

  it 'should pass test 2' do
    longest_palindrome('abag').must_equal(3)
  end
end
