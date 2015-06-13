require 'minitest/autorun'
require '../combinations'

describe 'combine' do
  it 'should pass test1' do
    results = combine(4, 2)
    results.sort!.must_equal([[1,2], [1,3],[1,4],[2,3], [2,4],[3,4]].sort!)
  end

  it 'should pass test2' do
    results = combine(4, 3)
    #results.sort.
    results.sort!.must_equal([[1,2,3], [1,2,4],[1,3,4], [2,3,4]].sort!)
  end

  it 'should pass test3' do
    results = combine(5, 3)
    results.sort!.must_equal([[1,2,3], [1,2,4],[1,3,4], [2,3,4], 
    [1,2,5], [1,3,5],[1,4,5], [2,3,5], [2,4,5],[3,4,5]].sort!)
  end

  it 'should pass test4' do
    results = combine(4, 4)
    results.sort!.must_equal([[1,2,3,4]].sort!)
  end

  it 'should pass test5' do
    results = combine(4, 1)
    results.sort!.must_equal([[1],[2],[3],[4]].sort!)
  end
end
