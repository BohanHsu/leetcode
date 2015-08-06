require 'minitest/autorun'
require '../longest_palindromic_substring'

describe 'longest_palindrome' do
  it 'should pass test when empty str' do
    longest_palindrome('').must_equal('')
  end
  
  it 'should pass test when only one char' do
    longest_palindrome('i').must_equal('i')
  end

  it 'should pass test 1' do
    longest_palindrome('sabag').must_equal('aba')
  end

  it 'should pass test 2' do
    longest_palindrome('abag').must_equal('aba')
  end

  it 'should pass test 3' do
    longest_palindrome('qabbav').must_equal('abba')
  end
end
