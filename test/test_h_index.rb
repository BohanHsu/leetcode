require 'minitest/autorun'
require '../h_index'

describe 'h_index(citations)' do
  it 'should work' do
    citations = [3, 0, 6, 1, 5]
    expected_result = 3
    h_index(citations).must_equal(expected_result)

    citations = [4, 0, 6, 1, 5]
    expected_result = 3
    h_index(citations).must_equal(expected_result)
  end
end
