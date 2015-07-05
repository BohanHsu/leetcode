require 'minitest/autorun'
require '../count_and_say'

describe 'next_num' do
  it 'should work 1' do
    next_num([1]).must_equal([1,1])
  end

  it 'should work 1' do
    next_num([1,1]).must_equal([2,1])
  end

  it 'should work 2' do
    next_num([2,1]).must_equal([1,2,1,1])
  end
end

describe 'count_and_say(n)' do
  it 'should work 1' do
    count_and_say(1).must_equal("1")
    count_and_say(2).must_equal("11")
    count_and_say(3).must_equal("21")
    count_and_say(4).must_equal("1211")
    count_and_say(5).must_equal("111221")
  end
end
