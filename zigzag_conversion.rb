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

def calculate_char_num_in_line(length, num_rows)
  modulee = num_rows * 2 - 2
  char_num_in_line = num_rows.times.map {nil}
  num_rows.times do |offset|
    if offset == 0
      nums = length / modulee
      nums += 1 if length % modulee != 0
    elsif offset == num_rows - 1
      nums = char_num_in_line[0]
      nums +=1 if length % modulee >= num_rows
    else
      nums = length / modulee * 2 - 2
      p "length=#{length}, modulee=#{modulee}, nums=#{nums}"
      nums += 1 if length % modulee >= offset || length % modulee == 0
      nums += 1 if length % modulee >= modulee - offset || length % modulee == 0
    end
    char_num_in_line[offset] = nums
  end
  char_num_in_line
end
