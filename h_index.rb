# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
  citations = citations.sort.reverse
  citations.length.times do |i|
    #p "citations[i]=#{citations[i]}, i=#{i}"
    if citations[i] < i + 1
      return i
    end
  end
end
