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
  return s if num_rows == 1
  modulee = num_rows * 2 - 2
  accumulated = calculate_accumulated_num_in_line(calculate_char_num_in_line(s.length, num_rows))
  cur_line = 0
  arr = s.length.times.map {nil}
  s.chars.each_with_index do |c, i|
    if i < accumulated[cur_line]
    elsif i == accumulated[cur_line]
      cur_line += 1
    end

    y = cur_line
    if cur_line == 0
      x = i
      new_index = x * modulee + y
    elsif cur_line == num_rows - 1
      x = i - accumulated[cur_line-1]
      new_index = x * modulee + y
    else
      x = (i - accumulated[cur_line-1]) / 2
      if (i - accumulated[cur_line-1]) % 2 == 0
        new_index = x * modulee + y
      else
        new_index = (x + 1) * modulee - y
      end
    end
    arr[new_index] = c
    #p "i=#{i}, c=#{c}, x=#{x}, y=#{y}, new_index=#{new_index}, arr=#{arr}"
  end
  arr.join ""
end

def calculate_char_num_in_line(length, num_rows)
  modulee = num_rows * 2 - 2
  char_num_in_line = num_rows.times.map {nil}
  num_rows.times do |offset|
    if offset == 0
      nums = length / modulee
      nums += 1 if length % modulee != 0
    elsif offset == num_rows - 1
      nums = char_num_in_line[0] - 1
      nums +=1 if (length % modulee >= num_rows) || length % modulee == 0
    else
      nums = length / modulee * 2
      ofs = length % modulee
      nums += 2 if ofs + offset > modulee
      nums += 1 if ofs + offset <= modulee && offset < ofs
    end
    char_num_in_line[offset] = nums
  end
  char_num_in_line
end

def calculate_accumulated_num_in_line(char_num_in_line)
  accumulated = char_num_in_line.map {nil}
  char_num_in_line.each_with_index do |e, i|
    if i == 0
      accumulated[i] = char_num_in_line[i]
    else
      accumulated[i] = e + accumulated[i-1]
    end
  end
  accumulated
end
