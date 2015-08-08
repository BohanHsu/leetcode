require 'minitest/autorun'
require '../interleaving_string'

describe 'is_interleave(s1, s2, s3)' do
  it 'should work' do
    s1 = "aabcc"
    s2 = "dbbca"
    
    s3 = "aadbbcbcac"
    is_interleave(s1, s2, s3).must_equal(true)
  end

  it 'should work1' do
    s1 = "aabcc"
    s2 = "dbbca"
    
    s3 = "aadbbbaccc"
    is_interleave(s1, s2, s3).must_equal(false)
  end

  it 'should work on corner case' do
    s1 = 'asdf'
    s2 = ''
    s3 = 'asdf'
    is_interleave(s1, s2, s3).must_equal(true)

    s2 = 'asdf'
    s1 = ''
    s3 = 'asdf'
    is_interleave(s1, s2, s3).must_equal(true)

    s2 = 'asdf1'
    s1 = ''
    s3 = 'asdf'
    is_interleave(s1, s2, s3).must_equal(false)
  end

  it 'should work on corner case1' do
    s2 = 'asdf1'
    s1 = ''
    s3 = 'asdf12'
    is_interleave(s1, s2, s3).must_equal(false)
  end

  it 'should pass test1' do
    s1 = "aabc"
    s2 = "abad"
    s3 = "aabadabc"
    is_interleave(s1, s2, s3).must_equal(true)
  end
end

