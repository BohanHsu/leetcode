require 'minitest/autorun'
require '../wildcard_matching'

describe 'is_match' do
  it 'should be pass isMatch("aa","a") -> false' do
    is_match("aa","a").must_equal(false)
  end

  it 'should be pass isMatch("aa","aa") -> true' do
    is_match("aa","aa").must_equal(true)
  end

  it 'should be pass isMatch("aaa","aa") -> false' do
    is_match("aaa","aa").must_equal(false)
  end

  it 'should be pass isMatch("aa","*") -> false' do
    is_match("aa","*").must_equal(true)
  end

  it 'should be pass isMatch("aa","a*") -> false' do
    is_match("aa","*").must_equal(true)
  end

  it 'should be pass isMatch("ab", "?*") -> false' do
    is_match("ab", "?*").must_equal(true)
  end

  it 'should be pass isMatch("aab", "c*a*b") -> false' do
    is_match("aab", "c*a*b").must_equal(false)
  end

  it 'should work on corner case' do
    is_match("", "*").must_equal(true)
  end

  it 'should work on corner case 1' do
    is_match("", "?").must_equal(false)
  end

  it 'should work on corner case 1' do
    is_match("b", "*?*?").must_equal(false)
  end

  it 'should work 1' do
    is_match("abefcdgiescdfimde", "ab*cd?i*de").must_equal(true)
  end
end
