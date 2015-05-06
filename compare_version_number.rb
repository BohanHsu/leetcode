# @param {String} version1
# @param {String} version2
# @return {Integer}
def compare_version(version1, version2)
  ver1 = version1.split(".").map do |elem|
    elem.to_i
  end
  ver2 = version2.split(".").map do |elem|
    elem.to_i
  end

  len1 = ver1.length
  len2 = ver2.length

  len = len1 < len2 ? len1 : len2
  (0...len).each do |i|
    if ver1[i] < ver2[i]
      return -1
    end
    
    if ver1[i] > ver2[i]
      return 1
    end
  end

  if len1 > len2
    return 0 if ver1[(len2...len1)].select { |elem| elem != 0 }.empty?
    return 1
  end

  if len1 < len2
    return 0 if ver2[(len1...len2)].select { |elem| elem != 0 }.empty?
    return -1
  end

  return 0
end
