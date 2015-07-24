require 'minitest/autorun'
require '../regular_expression_matching'

describe 'is_match(s, p)' do
  it 'should work 1' do
    s = 'babac'
    p = 'b.*ac'
    is_match(s, p).must_equal(true)
  end

  it 'should pass all test' do
    is_match("aa","a").must_equal(false)
    is_match("aa","aa").must_equal(true)
    is_match("aaa","aa").must_equal(false)
    is_match("aa", "a*").must_equal(true)
    is_match("aa", ".*").must_equal(true)
    is_match("ab", ".*").must_equal(true)
    is_match("aab", "c*a*b").must_equal(true)
  end

  it 'should pass corner case' do
    is_match("","a").must_equal(false)
    is_match("asdf","").must_equal(false)
    is_match("asdf",".*").must_equal(true)
    is_match("",".*").must_equal(true)
  end

  it 'should pass work 2' do
    s = "aaa"
    p = "ab*ac*a"
    is_match(s, p).must_equal(true)
  end

  it 'should pass work 3' do
    s = "aab"
    p = "b.*"
    is_match(s, p).must_equal(false)
  end

  it 'should pass work 4' do
    s = "aab"
    p = "b*"
    is_match(s, p).must_equal(false)
  end

  it 'should pass work 5' do
    s = "bbab"
    p = "b*a*"
    is_match(s, p).must_equal(false)
  end
end
