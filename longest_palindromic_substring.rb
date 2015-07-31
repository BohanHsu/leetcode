# Given a string S, find the longest palindromic substring in S. 
# You may assume that the maximum length of S is 1000, and there exists 
# one unique longest palindromic substring.

# @param {String} s
# @return {String}
def longest_palindrome(s)
  str = s
  arr = (s.length * 2 + 2).times.map { nil }

  arr[0] = '$'
  arr[1] = '#'

  s.length.times do |i|
    arr[i * 2 + 2] = s[i]
    arr[i * 2 + 3] = '#'
  end

  s = arr
  p = s.map { 0 }

  idx = 0
  i = 1
  max = -1
  max_i = nil

  while i < s.length do
    if idx + p[idx] > i
      p[i] = [
        p[2 * idx - i],
        idx + p[idx] - i
      ].min
    else
      p[i] = 0
    end

    while s[i - p[i]] == s[i + p[i]] do
      p[i] += 1
    end

    idx = i if i + p[i] > idx + p[idx]

    if p[i] > max
      max = p[i]
      max_i = i
    end

    i += 1
  end

  max -= 1

  if max_i.odd?
    return str[((max_i - 1) / 2 - (max / 2))...((max_i - 1) / 2 + (max / 2))]
  else
    return str[((max_i - 1) / 2 - (max / 2))..((max_i - 1) / 2 + (max / 2))]
  end
end
