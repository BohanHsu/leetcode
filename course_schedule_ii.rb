# There are a total of n courses you have to take, labeled from 0 to n - 1.

# Some courses may have prerequisites, for example to take course 0 you have to 
# first take course 1, which is expressed as a pair: [0,1]

# Given the total number of courses and a list of prerequisite pairs, return 
# the ordering of courses you should take to finish all courses.

# There may be multiple correct orders, you just need to return one of them. 
# If it is impossible to finish all courses, return an empty array.

# For example:
# 
# 2, [[1,0]]
# There are a total of 2 courses to take. To take course 1 you should have 
# finished course 0. So the correct course order is [0,1]
# 
# 4, [[1,0],[2,0],[3,1],[3,2]]
# There are a total of 4 courses to take. To take course 3 you should have 
# finished both courses 1 and 2. Both courses 1 and 2 should be taken after you 
# finished course 0. So one correct course order is [0,1,2,3]. 
# Another correct ordering is[0,2,1,3].

# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
  graph = {}
  in_degree = {}
  num_courses.times do |i|
    graph[i] = []
    in_degree[i] = 0
  end

  prerequisites.each do |prerequisite|
    graph[prerequisite[1]] << prerequisite[0]
    in_degree[prerequisite[0]] += 1
  end

  i = 0
  queue = []

  in_degree.each do |k, v|
    queue << k if v == 0
  end

  while i < queue.length do
    n = queue[i]
    graph[n].each do |v|
      in_degree[v] -= 1
      queue << v if in_degree[v] == 0
    end
    i += 1
  end

  queue.length == num_courses ? queue : []
end
