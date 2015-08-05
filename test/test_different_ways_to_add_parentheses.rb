require 'minitest/autorun'
require '../different_ways_to_add_parentheses'

describe 'diff_ways_to_compute(input)' do
  it 'should work' do
    input = "2-1-1"
    expected_result = [0, 2]
    diff_ways_to_compute(input).must_equal(expected_result)
  end

  it 'should work 2' do
    input = "2*3-4*5"
    expected_result = [-34, -14, -10, -10, 10]
    diff_ways_to_compute(input).must_equal(expected_result)
  end

  it 'should work at corner case' do
    input = "0"
    expected_result = [0]
    diff_ways_to_compute(input).must_equal(expected_result)
  end
end

describe 'str_to_arr(s)' do
  it 'should work' do
    s = "100 + 20 - 3"
    expected_result = [%w(100 20 3), ['+', '-']]
    str_to_arr(s).must_equal(expected_result)
  end
end

describe 'str_to_list(s)' do
  it 'should work' do
    s = "(1+(4+5+20)-30)"
    queue = ['(', 1, '+', '(', 4, '+', 5, '+', 20, ')', '-', 30, ')']
    str_to_list(s).must_equal(queue)
  end
end

describe 'to_rpn(s)' do
  it 'should work 1' do
    s = [3, '-', 4, '+', 5]
    queue = [3, 4, '-', 5, '+']
    to_rpn(s).must_equal(queue)
  end

  it 'should work 2' do
    s = [3, '-', '(', 4, '+', 5, ')']
    queue = [3, 4, 5, '+', '-']
    to_rpn(s).must_equal(queue)
  end

  it 'should work 3' do
    s = ["(", 7, ")", "-", "(", 0, ")", "+", "(", 4, ")"]
    queue = [7, 0, '-', 4, '+']
    to_rpn(s).must_equal(queue)
    s = [ 7, "-", 0, "+", 4]
    queue = [7, 0, '-', 4, '+']
    to_rpn(s).must_equal(queue)
  end
end

describe 'calculate(s)' do
  it 'should work 1' do
    s = "1 + 1"
    calculate(s).must_equal(2)

    s = " 2-1 + 2 "
    calculate(s).must_equal(3)

    s = "(1+(4+5+2)-3)+(6+8)"
    calculate(s).must_equal(23)
  end

  it 'should work 2' do
    s = "1 + 100 - 20 + (40 - 20) -1 + 26"
    val = 1 + 100 - 20 + (40 - 20) -1 + 26
    calculate(s).must_equal(val)
  end

  it 'should work 3' do
    s = "(7)-(0)+(4)"
    val = 11
    calculate(s).must_equal(val)
  end

  it 'should work 4' do
    s = "3+2*2"
    val = 7
    calculate(s).must_equal(val)
    s = " 3/2 "
    val = 1
    calculate(s).must_equal(val)
    s = " 3+5 / 2 "
    val = 5
    calculate(s).must_equal(val)
  end
end
