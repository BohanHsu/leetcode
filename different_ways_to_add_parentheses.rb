# Given a string of numbers and operators, return all possible results from 
# computing all the different possible ways to group numbers and operators. 
# The valid operators are +, - and *.

# Example 1
# Input: "2-1-1".

# ((2-1)-1) = 0
# (2-(1-1)) = 2
# Output: [0, 2]


# Example 2
# Input: "2*3-4*5"
# 
# (2*(3-(4*5))) = -34
# ((2*3)-(4*5)) = -14
# ((2*(3-4))*5) = -10
# (2*((3-4)*5)) = -10
# (((2*3)-4)*5) = 10
# Output: [-34, -14, -10, -10, 10]

# @param {String} input
# @return {Integer[]}
def diff_ways_to_compute(input)
  results = {}
  array_representation = str_to_arr input
  nums = array_representation[0]
  operators = array_representation[1]
  eval(results, nums, operators)
  results.map do |k, v|
    v
  end.sort
end

def eval(results, nums, operators)
  if nums.length == 1 && operators.length == 0
    results[nums[0]] = calculate(nums[0]) if results[nums[0]].nil?
  else
    (0...operators.length).each do |i|
      eval(results, nums[0...i] + ["(#{nums[i]} #{operators[i]} #{nums[i+1]})"] + nums[(i+2)...nums.length], operators[0...i] + operators[(i+1)...operators.length])
    end
  end
end

def exp_to_s(nums, operators)
  s = ""
  operators.length.times do |i|
    s += "#{nums[i]} #{operators[i]}"
  end
  s += "#{nums[operators.length]}"
  s
end

def str_to_arr(s)
  nums = []
  opr = []
  i = 0
  j = -1
  s.length.times do |i|
    if s[i].to_i.to_s == s[i]
      j = i if j == -1
      if s[i+1].to_i.to_s != s[i+1]
        #nums << s[j..i].to_i
        nums << s[j..i]
        j = -1
      end
    elsif s[i] == '+' || s[i] == '-' || s[i] == '*'
      opr << s[i]
    end
  end
  [nums, opr]
end

# @param {String} s
# @return {Integer}
def calculate(s)
  s = to_rpn(str_to_list(s))
  stack = []

  s.each do |e|
    if e.to_s.to_i == e
      stack << e
    else
      operand1 = stack.pop
      operand2 = stack.pop
      result = nil
      if e == '+'
        result = operand2 + operand1
      elsif e == '-'
        result = operand2 - operand1
      elsif e == '*'
        result = operand2 * operand1
      elsif e == '/'
        result = operand2 / operand1
      end
      stack << result
    end
  end
  stack[0]
end

def to_rpn(s)
  precedence = {
    '+' => 1,
    '-' => 1,
    '*' => 2,
    '/' => 2,
  }
  queue = []
  stack = []

  s.each do |e|
    case
    when e == '('
      stack << e
    when e == ')'
      while !stack.empty? && stack.last != '(' do
        queue << stack.pop
      end
      stack.pop

    when e == '+' || e == '-' || e == '*' || e == '/'
      while !stack.empty? && (stack.last == '+' || stack.last == '-' || stack.last == '*' || stack.last == '/') && precedence[e] <= precedence[stack.last] do
        queue << stack.pop
      end

      stack << e
    when e.to_s.to_i == e
      queue << e
    end
    #p "stack=#{stack}"
  end

  while !stack.empty? do
    operator = stack.pop
    queue << operator if operator != '('
  end

  queue
end

def str_to_list(s)
  queue = []

  j = nil
  s.length.times do |i|
    case 
    when s[i] == ' '
    when s[i] == '(' || s[i] == ')' || s[i] == '+' || s[i] == '-' || s[i] == '*' || s[i] == '/'
      queue << s[i]
    when s[i].to_i.to_s == s[i]
      if j.nil?
        j = i
      end
      if i + 1 == s.length || s[i+1].to_i.to_s != s[i+1]
        queue << s[j..i].to_i
        j = nil
      end
    end
  end

  queue
end
