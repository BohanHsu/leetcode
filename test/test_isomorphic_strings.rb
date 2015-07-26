require 'minitest/autorun'
require '../isomorphic_strings'

describe 'is_isomorphic(s, t)' do
  it 'should work' do
    is_isomorphic('egg', 'add').must_equal(true)
    is_isomorphic('foo', 'bar').must_equal(false)
    is_isomorphic('paper', 'title').must_equal(true)
  end

  it 'should work 1' do
    is_isomorphic('aa', 'ab').must_equal(false)
  end
end
