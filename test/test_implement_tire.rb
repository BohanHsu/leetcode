require 'minitest/autorun'
require '../implement_tire'

describe 'Trie' do
  before do
    @trie = Trie.new
    @trie.insert("sori")
    @trie.insert("sohi")
    @trie.insert("so")
    @trie.insert("")
  end

  it 'should insert word' do

    n = @trie.root

    n.childs.size.must_equal(1)
    n.is_word.must_equal(true)
    n.childs['s'].wont_be_nil

    n = n.childs['s']
    n.is_word.must_equal(false)
    n.childs.size.must_equal(1)
    n.childs['o'].wont_be_nil

    n = n.childs['o']
    n.is_word.must_equal(true)
    n.childs['r'].wont_be_nil
    n.childs['h'].wont_be_nil

    n1 = n

    n = n.childs['r']
    n.is_word.must_equal(false)
    n.childs.size.must_equal(1)
    n.childs['i'].wont_be_nil

    n = n.childs['i']
    n.is_word.must_equal(true)
    n.childs.size.must_equal(0)

    n = n1.childs['h']
    n.is_word.must_equal(false)
    n.childs.size.must_equal(1)
    n.childs['i'].wont_be_nil

    n = n.childs['i']
    n.is_word.must_equal(true)
    n.childs.size.must_equal(0)
  end

  it 'should search word' do
    @trie.search('').must_equal(true)
    @trie.search('s').must_equal(false)
    @trie.search('p').must_equal(false)
    @trie.search('so').must_equal(true)
    @trie.search('soh').must_equal(false)
    @trie.search('sor').must_equal(false)
    @trie.search('sohi').must_equal(true)
    @trie.search('sori').must_equal(true)
    @trie.search('sorii').must_equal(false)
  end

  it 'should search prefix' do
    @trie.starts_with("").must_equal(true)
    @trie.starts_with("s").must_equal(true)
    @trie.starts_with("p").must_equal(false)
    @trie.starts_with("so").must_equal(true)
    @trie.starts_with("sp").must_equal(false)
    @trie.starts_with("sorii").must_equal(false)
  end

end
