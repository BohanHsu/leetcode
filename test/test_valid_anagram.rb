require 'minitest/autorun'
require '../valid_anagram'

describe 'is_anagram(s, t)' do
  it 'should work' do
    s = "anagram"
    t = "nagaram"
    res = true
    is_anagram(s, t).must_equal(res)

    s = "car"
    t = "cat"
    res = true
    is_anagram(s, t).must_equal(false)
  end
end
