require 'minitest/autorun'
require '../palindrome_number'

describe 'is_palindrome(x)' do
  it 'should work 1' do
    is_palindrome(0).must_equal(true)
    is_palindrome(1).must_equal(true)
    is_palindrome(11).must_equal(true)
    is_palindrome(111).must_equal(true)
    is_palindrome(191).must_equal(true)
    is_palindrome(-191).must_equal(false)
    is_palindrome(1221).must_equal(true)
    is_palindrome(1191).must_equal(false)
  end
end
