require 'minitest/autorun'
require '../generate_parentheses'

describe 'generate_parenthesis(n)' do
  it 'should work' do
    n = 3
    expected_result = ["((()))", "(()())", "(())()", "()(())", "()()()"]
    generate_parenthesis(n).sort.must_equal(expected_result.sort)
  end

  it 'should work when n = 4' do
    n = 4
    expected_result = ["(((())))","((()()))","((())())","((()))()","(()(()))",
      "(()()())","(()())()","(())(())","(())()()","()((()))","()(()())",
      "()(())()","()()(())","()()()()"]
    generate_parenthesis(n).sort.must_equal(expected_result.sort)
  end

  it 'should work when n = 4' do
    n = 1
    expected_result = ['()']
    generate_parenthesis(n).sort.must_equal(expected_result.sort)
  end

end
