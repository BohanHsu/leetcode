# @param {Integer} numerator
# @param {Integer} denominator
# @return {String}
def fraction_to_decimal(numerator, denominator)
  ans = ''

  if numerator * denominator < 0
    ans += '-'
  end

  numerator = numerator.abs
  denominator = denominator.abs

  stack = []
  h = {}
  integers = numerator / denominator

  recurring = -1
  while numerator != 0 do
    if h.has_key? numerator
      break
    end
    stack << numerator / denominator
    h[numerator] = stack.length - 1
    numerator = numerator % denominator
    if numerator < denominator
      numerator *= 10
    end
  end

  if numerator != 0
    recurring = h[numerator]
    non_recurring_frac = stack[(0...recurring)]
    recurring_frac = stack[(recurring...stack.length)]
    integer = non_recurring_frac.delete_at(0)
    ans = ans + integer.to_s + "." + non_recurring_frac.join("") + "(" + recurring_frac.join("") + ")"
  else
    integer = stack.delete_at(0)
    integer = 0 if integer.nil?
    non_recurring_frac = stack
    if stack.empty?
      ans = ans + integer.to_s
    else
      ans = ans + integer.to_s + "." + non_recurring_frac.join("")
    end
  end
  ans
end
