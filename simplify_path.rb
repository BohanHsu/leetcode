# Given an absolute path for a file (Unix-style), simplify it.

# For example,
# path = "/home/", => "/home"
# path = "/a/./b/../../c/", => "/c"
#
# Corner Cases:
# Did you consider the case where path = "/../"?
# In this case, you should return "/".
# Another corner case is the path might contain multiple slashes '/' 
# together, such as "/home//foo/".
# In this case, you should ignore redundant slashes and return "/home/foo".

# @param {String} path
# @return {String}
def simplify_path(path)
  stack = []
  path_array = path.split(/\//).select { |s| !s.empty? }
  path_array.each do |dir|
    case dir
    when '.'
    when '..'
      stack.pop unless stack.empty?
    else
      stack.push dir
    end
  end
  '/' + stack.join('/')
end
