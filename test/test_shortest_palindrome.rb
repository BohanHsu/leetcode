require 'minitest/autorun'
require '../shortest_palindrome'

describe 'shortest_palindrome(s)' do
  it 'should work' do
    s = "aacecaaa"
    expect_result = "aaacecaaa"
    shortest_palindrome(s).must_equal(expect_result)
  end

  it 'should work 1' do
    s = "abb"
    expect_result = "bbabb"
    shortest_palindrome(s).must_equal(expect_result)
  end

  it 'should work 2' do
    s = "adcba"
    expect_result = "abcdadcba"
    shortest_palindrome(s).must_equal(expect_result)
  end

end
