require 'minitest/autorun'
require '../word_search'

describe 'exist' do
  it 'should work with example1' do
    board = [
      ["ABCE"],
      ["SFCS"],
      ["ADEE"]
    ]
    board = convert_board board
    word = "ABCCED"
    exist(board, word).must_equal(true)
  end

  it 'should work with example2' do
    board = [
      ["ABCE"],
      ["SFCS"],
      ["ADEE"]
    ]
    board = convert_board board
    word = "SEE"
    exist(board, word).must_equal(true)
  end

  it 'should work with example3' do
    board = [
      ["ABCE"],
      ["SFCS"],
      ["ADEE"]
    ]
    board = convert_board board
    word = "ABCB"
    exist(board, word).must_equal(false)
  end

  it 'should work with coner case1' do
    board = [
      ["A"]
    ]
    board = convert_board board
    word = "A"
    exist(board, word).must_equal(true)
  end

  it 'should work with coner case2' do
    board = [
      ["A"]
    ]
    board = convert_board board
    word = "AB"
    exist(board, word).must_equal(false)
  end

  it 'should work with coner test1' do
    board = [
      ["ABCE"],
      ["SFES"],
      ["ADEE"]
    ]
    board = convert_board board
    word = "ABCESEEEFS"
    exist(board, word).must_equal(true)
  end


end
