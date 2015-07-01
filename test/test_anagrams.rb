require 'minitest/autorun'
require '../anagrams'

describe 'str_hash_func' do
  it 'should work 1' do
    str = 'a'
    str_hash_func(str).must_equal(1)
  end

  it 'should work 2' do
    str = 'aa'
    str_hash_func(str).must_equal(27)
  end

  it 'should work 3' do
    str = 'ab'
    str_hash_func(str).must_equal(28)
  end

  it 'should work 4' do
    str = 'ba'
    str_hash_func(str).must_equal(28)
  end
end

describe 'anagrams' do
  it 'shuold work 1' do
    strs = [
      "ab",
      "ba",
      "abc",
      "bac",
    ]
    expected_result = [
      'ab',
      'ba',
      'abc',
      'bac'
    ]
    anagrams(strs).must_equal(expected_result)
  end
end
