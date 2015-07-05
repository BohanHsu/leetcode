# Given two numbers represented as strings, return multiplication of the numbers
# as a string.
# Note: The numbers can be arbitrarily large and are non-negative.

# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
  dot1 = num1.length - 1
  dot2 = num2.length - 1

  array1 = num1.chars.map.with_index do |e, i|
    if e == '.'
      dot1 = i
      nil
    else
      e.to_i
    end
  end.select do |e|
    !e.nil?
  end

  array2 = num2.chars.map.with_index do |e, i|
    if e == '.'
      dot2 = i
      nil
    else
      e.to_i
    end
  end.select do |e|
    !e.nil?
  end

  results = (array1.length + array2.length + 2).times.map do
    nil
  end

  d0 = d1 = nil
  d1 = 0
  array2.length.times do |i|
    d1 = 0
    array1.length.times do |j|
      i2 = array2.length - 1 - i
      i1 = array1.length - 1 - j

      raw_mutiply = array1[i1] * array2[i2] + d1 +
        (results[results.length - 1 - i -  j].nil? ? 0 : 
         results[results.length - 1 - i -  j])

      d0 = raw_mutiply % 10
      d1 = raw_mutiply / 10

      results[results.length - 1 - i -  j] = d0
    end

    unless d1 == 0
      results[results.length - i - array1.length - 1] = d1
    end
  end

  unless d1 == 0
    results[results.length - array1.length - array2.length] = d1
  end

  results.select! do |e|
    !e.nil?
  end.map! do |e|
    e.to_s
  end

  unless dot1 == num1.length - 1 && dot2 == num2.length - 1
    results.insert((results.length - (num1.length - 1 - dot1 + num2.length - 1 - dot2)), '.')
  end

  (results.length - 1).times do |i|
    unless results[i] == '0' && results[i+1] == '0'
      results = results[i..-1]
      break
    end
    if i == results.length - 2
      results = [0]
    end
  end

  results.join ""
end
