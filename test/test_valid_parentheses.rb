require 'minitest/autorun'
require '../valid_parentheses'

describe 'is_valid(s)' do
  it 'should recognize valid' do
    is_valid("()").must_equal(true)
    is_valid("()[]{}").must_equal(true)
  end

  it 'should recognize invalid' do
    is_valid("(]").must_equal(false)
    is_valid("([)]").must_equal(false)
  end
end
