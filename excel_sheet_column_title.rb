# @param {Integer} n
# @return {String}
def convert_to_title(n)
  str = ""
  remainder = n % 26
  quotient = n / 26
  if remainder == 0
    quotient -= 1
    str = dictionary(26) + str
  else
    str = dictionary(remainder) + str
  end

  while quotient > 0 do
    remainder = quotient % 26
    quotient = quotient / 26
    if remainder == 0
      quotient -= 1
      str = dictionary(26) + str
    else
      str = dictionary(remainder) + str
    end
  end

  str
end

def dictionary(num)
  (num + 64).chr
end
