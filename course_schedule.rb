# There are a total of n courses you have to take, labeled from 0 to n - 1.

# Some courses may have prerequisites, for example to take course 0 you have to 
# first take course 1, which is expressed as a pair: [0,1]

# Given the total number of courses and a list of prerequisite pairs, is it 
# possible for you to finish all courses?
# 
# For example:
# 
#   2, [[1,0]]
# There are a total of 2 courses to take. To take course 1 you should have 
# finished course 0. So it is possible.
# 
#   2, [[1,0],[0,1]]
# There are a total of 2 courses to take. To take course 1 you should have 
# finished course 0, and to take course 0 you should also have finished course 1. 
# So it is impossible.

# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  graph = {}
  in_degree = {}
  num_courses.times do |i|
    graph[i] = []
    in_degree[i] = 0
  end

  prerequisites.each do |prerequisite|
    graph[prerequisite[0]] << prerequisite[1]
    in_degree[prerequisite[1]] += 1
  end

  queue = []

  in_degree.each do |k, v|
    queue << k if v == 0
  end

  while !queue.empty? do
    n = queue.shift

    graph[n].each do |u|
      in_degree[u] -= 1
      queue << u if in_degree[u] == 0
    end
  end

  in_degree.each do |k, v|
    return false if v != 0
  end

  true
end
