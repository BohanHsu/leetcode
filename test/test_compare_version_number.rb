require 'minitest/autorun'
require '../compare_version_number'

describe 'compare_version' do
  it 'should pass test1' do
    compare_version('1.2.4', '1.3').must_equal(-1)
  end

  it 'should pass test2' do
    compare_version('1.2.0', '1.2').must_equal(0)
  end
end
