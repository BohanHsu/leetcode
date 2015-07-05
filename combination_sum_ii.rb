# Given a collection of candidate numbers (C) and a target number (T), find 
# all unique combinations in C where the candidate numbers sums to T.
# Each number in C may only be used once in the combination.

# Note:
# All numbers (including target) will be positive integers.
# Elements in a combination (a1, a2, … , ak) must be in non-descending order. (ie, a1 ≤ a2 ≤ … ≤ ak).
# The solution set must not contain duplicate combinations.
# For example, given candidate set 10,1,2,7,6,1,5 and target 8, 
# A solution set is: 
# [1, 7] 
# [1, 2, 5] 
# [2, 6] 
# [1, 1, 6] 

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
  results = []
  root = { :prev => nil, :length => Float::INFINITY, :sum => 0, :index => nil }
  q = Queue.new
  q << root

  until q.empty? do
    n = q.pop
    if n[:sum] == target
      new_combination = []
      until n.nil? do
        if n[:sum] != 0
          new_combination << n[:length]
        end
        n = n[:prev]
      end
      results << new_combination
    elsif n[:sum] < target
      h = {}
      current_path = [].tap do |used|
        m = n
        until m.nil? do
          if m[:sum] != 0
            used << m[:index]
          end
          m = m[:prev]
        end
      end
      candidates.each_with_index do |e, i|
        if e <= n[:length] && !current_path.include?(i) && h[e].nil?
          q << { :prev => n, :length => e, :sum => (n[:sum] + e), :index => i }
          h[e] = true
        end
      end
    end
  end

  results
end
