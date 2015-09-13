# @param {Integer} n
# @return {Integer}
def nth_ugly_number(n)
  i2, i3, i5 = 0, 0, 0
  arr = [1]

  while arr.length < n do
    m2 = arr[i2] * 2
    m3 = arr[i3] * 3
    m5 = arr[i5] * 5

    min = [m2, m3, m5].min

    i2 += 1 if m2 == min
    i3 += 1 if m3 == min
    i5 += 1 if m5 == min

    arr << min
    #p "#{arr}, i2=#{i2}, i3=#{i3}, i5=#{i5}"
  end

  arr.last
end
