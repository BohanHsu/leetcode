# The string "PAYPALISHIRING" is written in a zigzag pattern on a 
# given number of rows like this: (you may want to display this pattern 
# in a fixed font for better legibility)

# P   A   H   N
# A P L S I I G
# Y   I   R

# And then read line by line: "PAHNAPLSIIGYIR"
# Write the code that will take a string and make this conversion given 
# a number of rows:

# string convert(string text, int nRows);
# convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".

# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  modulee = num_rows * 2 - 2
  i_last = s.length - 1
end

def calculate_char_num_in_line(num_rows)
  modulee = num_rows * 2 - 2
  char_num_in_line = num_rows.times.each {nil}
  num_rows.times.each do |offset|
    if offset == 0
      nums = i_last / modulee + 1
    else
      nums = i_last / modulee - 2
      nums += 1 if i_last % modulee >= offset
      nums += 1 if i_last % modulee >= modulee - offset
    end
    char_num_in_line[offset] = nums
  end
end
