# Implement a basic calculator to evaluate a simple expression string.

# The expression string contains only non-negative integers, +, -, *, / 
# operators and empty spaces . The integer division should truncate toward zero.

# You may assume that the given expression is always valid.

# Some examples:
# "3+2*2" = 7
# " 3/2 " = 1
# " 3+5 / 2 " = 5
# Note: Do not use the eval built-in library function.

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
