# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {String[]}
def binary_tree_paths(root)
  return [] if root.nil?
  stack = [root]
  parent = {}
  dist = {}
  dist[root] = 0
  leaf = []

  while !stack.empty? do
    node = stack.pop

    if node.right
      dist[node.right] = dist[node] + 1
      parent[node.right] = node
      stack << node.right
    end

    if node.left
      dist[node.left] = dist[node] + 1
      parent[node.left] = node
      stack << node.left
    end


    if node.left.nil? && node.right.nil?
      leaf << node
    end
  end

  results = leaf.size.times.map {nil}
  i = 0

  leaf.each do |node|
    path_arr = (dist[node] * 2 - 1).times.map { nil }
    while node do
      path_arr[(dist[node]) * 2] = node.val
      node = parent[node]
    end
    results[i] = path_arr.map do |e|
      e.nil? ? "->" : e.to_s
    end.join("")
    i += 1
  end
  results
end
