require 'minitest/autorun'
require '../edit_distance'

describe 'min_distance' do
  it 'should pass test1' do
    word1 = 'abcd'
    word2 = 'abcde'
    min_distance(word1, word2).must_equal(1)
  end

  it 'should pass test2' do
    word1 = 'abcd'
    word2 = ''
    min_distance(word1, word2).must_equal(4)
  end

  it 'should pass test3' do
    word1 = 'abcd'
    word2 = '1'
    min_distance(word2, word1).must_equal(4)
  end

  it 'should pass test4' do
    word1 = 'ab1cd'
    word2 = 'abcde'
    min_distance(word1, word2).must_equal(2)
  end

  it 'should pass test5' do
    word1 = 'a'
    word2 = 'ab'
    min_distance(word1, word2).must_equal(1)
  end

  it 'should pass test6' do
    word1 = 'a'
    word2 = 'b'
    min_distance(word1, word2).must_equal(1)
  end
end
