# Given an array of words and a length L, format the text such that each 
# line has exactly L characters and is fully (left and right) justified.

# You should pack your words in a greedy approach; that is, pack as many 
# words as you can in each line. Pad extra spaces ' ' when necessary so 
# that each line has exactly L characters.

# Extra spaces between words should be distributed as evenly as possible. 
# If the number of spaces on a line do not divide evenly between words, 
# the empty slots on the left will be assigned more spaces than the 
# slots on the right.

# For the last line of text, it should be left justified and no extra 
# space is inserted between words.

# For example,
# words: ["This", "is", "an", "example", "of", "text", "justification."]
# L: 16.

# Return the formatted lines as:
# [
#      "This    is    an",
#      "example  of text",
#      "justification.  "
# ]
# Note: Each word is guaranteed not to exceed L in length.

# Corner Cases:
# A line other than the last line might contain only one word. What 
# should you do in this case?
#   In this case, that line should be left-justified.

# @param {String[]} words
# @param {Integer} max_width
# @return {String[]}
def full_justify(words, max_width)
  result = []
  index = 0

  while index < words.length do
    len = 0
    i = index

    while true do
      if i == words.length
        break 
      end
      if words[i].length + len + i - index > max_width
        break 
      end
      len += words[i].length
      i += 1
    end

    if i != words.length
      if i - index != 1
        quotient = (max_width - len) / (i - index - 1)
        remainder = (max_width - len) % (i - index - 1)
      else
        quotient = max_width - words[index].length
        remainder = 0
      end

      words[(index...i)].each_with_index do |e, idx|
        if idx < remainder
          words[idx+index] = e + " " * (quotient + 1)
        elsif idx != i - 1 - index 
          words[idx+index] = e + " " * quotient
        elsif idx == i - 1 - index && idx == 0
          words[idx+index] = e + " " * quotient
        end
      end
      str = words[(index...i)].inject("") do |memo, obj|
        memo + obj
      end

      result << str
    else
      result << words[(index...i)].join(" ") + " " * (max_width - len - i + index + 1) 
    end
    index = i
  end
  result
end
