# Given a string S, you are allowed to convert it to a palindrome by adding 
# characters in front of it. Find and return the shortest palindrome you can 
# find by performing this transformation.

# For example:
# Given "aacecaaa", return "aaacecaaa".
# Given "abcd", return "dcbabcd".

# @param {String} s
# @return {String}
def shortest_palindrome(s)
  str = s
  arr = (s.length * 2 + 2).times.map { nil }

  arr[0] = '$'
  arr[1] = '#'

  s.length.times do |i|
    arr[2+i * 2] = s[i]
    arr[3+i * 2] = '#'
  end

  s = arr

  p = s.map { 0 }

  i = 1
  idx = 0
  max = 0

  while i < s.length do
    if p[idx] + idx > i
      p[i] = [
        p[2 * idx - i], 
        idx + p[idx] - i
      ].min
    else
      p[i] = 1
    end

    while s[i + p[i]] == s[i - p[i]] do
      p[i] += 1
    end


    idx = i if p[i] + i > p[idx] + idx

    max = [max, i].max if p[i] == i

    i += 1
  end

  max = max - 1

  result = (str.length * 2 - max).times.map { nil }

  (str.length - max).times do |i|
    result[i] = str[str.length - i - 1]
  end

  str.length.times do |i|
    result[s.length - max + i + 1] = str[i]
  end

  result.join ""
end
