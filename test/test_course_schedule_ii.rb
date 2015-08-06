require 'minitest/autorun'
require '../course_schedule_ii'

describe 'find_order(num_courses, prerequisites)' do
  it 'should work 1' do
    num_courses, prerequisites = 2, [[1,0]]
    expected_result = [0,1]
    find_order(num_courses, prerequisites).must_equal(expected_result)
  end

  it 'should work 2' do
    num_courses, prerequisites = 4, [[1,0],[2,0],[3,1],[3,2]]
    expected_result = [[0,1,2,3], [0,2,1,3]]
    expected_result.include?(find_order(num_courses, prerequisites)).must_equal(true)
  end

  it 'should return empty array if can\'t finished' do
    num_courses, prerequisites = 4, [[1,0],[0,1],[3,1],[3,2]]
    expected_result = []
    find_order(num_courses, prerequisites).must_equal(expected_result)
  end
end
