require 'minitest/autorun'
require '../longest_valid_parentheses'

describe 'longest_valid_parentheses(s)' do
  it 'should work 1' do
    s = "(()"
    longest_valid_parentheses(s).must_equal("()".length)
  end

  it 'should work 2' do
    s = ")()())"
    longest_valid_parentheses(s).must_equal("()()".length)
  end

  it 'should work 3' do
    s = "()((((()())))"
    longest_valid_parentheses(s).must_equal("(((()())))".length)
  end

  it 'should work for corner case 1' do
    s = ""
    longest_valid_parentheses(s).must_equal(0)
  end

  it 'should work for corner case 2' do
    s = "("
    longest_valid_parentheses(s).must_equal(0)
  end

  it 'should work for corner case 3' do
    s = ")"
    longest_valid_parentheses(s).must_equal(0)
  end

  it 'should pass test case 1' do
    s = '()'
    longest_valid_parentheses(s).must_equal(2)
  end

  it 'should pass test case 2' do
    s = '()()'
    longest_valid_parentheses(s).must_equal(4)
  end
end
