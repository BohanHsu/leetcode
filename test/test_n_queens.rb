require 'minitest/autorun'
require '../n_queens'

describe 'new_queen_safe?' do
  before do 
    @parent = {
      0 => {},
      1 => {2 => 0}
    }
    @i = 0
    @j = 0
    @new_i = 1
    @new_j = 2
  end

  it 'should not safe when new queen under attack 1' do
    @new_j = 0
    new_queen_safe?(@parent, @i, @j, @new_i, @new_j).must_equal(false)
  end

  it 'should not safe when new queen under attack 2' do
    @new_j = 1
    new_queen_safe?(@parent, @i, @j, @new_i, @new_j).must_equal(false)
  end

  it 'should not safe when new queen under attack 3' do
    @new_1 = 2
    @i = 1
    @j = 2
    new_queen_safe?(@parent, @i, @j, @new_i, @new_j).must_equal(false)
  end

  it 'should not safe when new queen under attack 4' do
    @new_1 = 0
    @i = 1
    @j = 2
    new_queen_safe?(@parent, @i, @j, @new_i, @new_j).must_equal(false)
  end

  it 'should safe when new queen not under attack 1' do
    new_queen_safe?(@parent, @i, @j, @new_i, @new_j).must_equal(true)
  end

  it 'should safe when new queen not under attack 2' do
    @i = 1
    @j = 2
    @new_i = 2
    @new_j = 4
    new_queen_safe?(@parent, @i, @j, @new_i, @new_j).must_equal(true)
  end
end

describe 'parent_to_board' do
  # [
  #  [".Q..",  // Solution 1
  #   "...Q",
  #   "Q...",
  #  "..Q."],
  it 'should convert parent to board' do
    i = 3
    j = 2
    parent = {
      3 => {2 => 0},
      2 => {0 => 3},
      1 => {3 => 1},
      0 => {}
    }
    expected_result = [
      ".Q..",
      "...Q",
      "Q...",
      "..Q."
    ]
    parent_to_board(parent, i, j).must_equal(expected_result)
  end
end

describe 'solve_n_queens' do
  it 'should work when n = 1' do
    expected_result = [['Q']]
    solve_n_queens(1).must_equal(expected_result)
  end

  it 'should work when n = 2' do
    expected_result = []
    solve_n_queens(2).must_equal(expected_result)
  end

  it 'should work when n = 3' do
    expected_result = []
    solve_n_queens(3).must_equal(expected_result)
  end

  it 'should work when n = 4' do
    expected_result = [
      [".Q..",
       "...Q",
       "Q...",
      "..Q."],
    
      ["..Q.",
       "Q...",
       "...Q",
       ".Q.."]
    ]
    solve_n_queens(4).must_equal(expected_result)
  end
end
