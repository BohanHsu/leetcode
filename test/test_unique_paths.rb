require 'minitest/autorun'
require '../unique_paths'

describe 'unique_paths' do
  it 'should work when m=3,n=3' do
    unique_paths(3,3).must_equal(6)
  end
end
