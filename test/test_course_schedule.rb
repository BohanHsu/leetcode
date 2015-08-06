require 'minitest/autorun'
require '../course_schedule'

#describe 'class Graph' do
#  it 'should return false if detect cyclic' do
#    graph = {
#      0 => [1],
#      1 => [2],
#      2 => [0]
#    }
#
#    g = Graph.new graph
#    g.check_acyclic.must_equal(false)
#  end
#
#  it 'should return true if detect acyclic' do
#    graph = {
#      0 => [1],
#      1 => [2]
#    }
#
#    g = Graph.new graph
#    g.check_acyclic.must_equal(true)
#  end
#end

describe 'can_finish(num_courses, prerequisites)' do
  it 'should return true if can finished' do
    num_courses, prerequisites = 2, [[1,0]]
    expected_result = true
    can_finish(num_courses, prerequisites).must_equal(expected_result)
  end

  it 'should return false if can\'t finished' do
    num_courses, prerequisites = 2, [[1,0], [0,1]]
    expected_result = false
    can_finish(num_courses, prerequisites).must_equal(expected_result)
  end

  it 'should word' do
    num_courses, prerequisites = 10, [[5,8],[3,5],[1,9],[4,5],[0,2],[1,9],[7,8],[4,9]]
    expected_result = true
    can_finish(num_courses, prerequisites).must_equal(expected_result)
  end

  it 'should work' do
    num_courses, prerequisites = 3, [[0,1],[0,2],[1,2]]
    expected_result = true
    can_finish(num_courses, prerequisites).must_equal(expected_result)
  end
end
