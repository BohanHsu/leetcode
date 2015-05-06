require 'minitest/autorun'
require '../majority_element'

describe 'majority_element' do
  it 'should do test1' do 
    majority_element([2, 2, 3, 5, 2, 2, 6]).must_equal(2)
  end

end
