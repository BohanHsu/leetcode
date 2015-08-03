# Find the total area covered by two rectilinear rectangles in a 2D plane.

# Each rectangle is defined by its bottom left corner and top right corner as 
# shown in the figure.

# Rectangle Area
# Assume that the total area is never beyond the maximum possible value of int.

# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @param {Integer} d
# @param {Integer} e
# @param {Integer} f
# @param {Integer} g
# @param {Integer} h
# @return {Integer}
def compute_area(a, b, c, d, e, f, g, h)
  (c - a) * (d - b) + (g - e) * (h - f) - union_area(a, b, c, d, e, f, g, h)
end

def union_area(a, b, c, d, e, f, g, h)
  return 0 if c < e || g < a || d < f || h < b

  width = -1
  if e <= a && c <= g
    width = c - a
  elsif a <= e && g <= c
    width = g - e
  elsif a <= e && e <= c
    width = c - e
  elsif a <= g && g <= c
    width = g - a
  end

  height = -1
  if f <= b && d <= h
    height = d - b
  elsif b <= f && h <= d
    height = h - f
  elsif b <= f && f <= d
    height = d - f
  elsif b <= h && h <= d
    height = h - b
  end

  width * height
end
