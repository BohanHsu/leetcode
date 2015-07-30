# Implement a trie with insert, search, and startsWith methods.

# Note:
# You may assume that all inputs are consist of lowercase letters a-z.

class TrieNode
  attr_accessor :is_word, :parent, :childs, :character

  # Initialize your data structure here.
  def initialize
    @character = nil
    @is_word = false
    @parent = nil
    @childs = {}
  end

  def has_child?(char)
    !@childs[char].nil?
  end
end

class Trie
  attr_accessor :root
  def initialize
    @root = TrieNode.new
  end

  # @param {string} word
  # @return {void}
  # Inserts a word into the trie.
  def insert(word)
    n = @root
    if word.length == 0
      n.is_word = true
      return
    end
    word.length.times do |i|
      if n.has_child?(word[i])
        n = n.childs[word[i]]
        n.is_word = true if i == word.length - 1
      else
        m = TrieNode.new
        m.character = word[i]
        m.is_word = (i == (word.length - 1))
        m.parent = n
        n.childs[word[i]] = m
        n = m
      end
    end
    nil
  end

  # @param {string} word
  # @return {boolean}
  # Returns if the word is in the trie.
  def search(word)
    n = @root
    if word.length == 0
      return n.is_word
    end
    i = 0
    while i < word.length do
      return false if n.childs[word[i]].nil?
      n = n.childs[word[i]]
      i += 1
    end
    
    return n.is_word
  end

  # @param {string} prefix
  # @return {boolean}
  # Returns if there is any word in the trie
  # that starts with the given prefix.
  def starts_with(prefix)
    n = @root
    if prefix.length == 0
      return n.childs.size != 0
    end
    i = 0

    while i < prefix.length do
      return false if n.childs[prefix[i]].nil?
      n = n.childs[prefix[i]]
      i += 1
    end

    true
  end
end

# Your Trie object will be instantiated and called as such:
# trie = Trie.new
# trie.insert("somestring")
# trie.search("key")
