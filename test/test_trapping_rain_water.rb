require 'minitest/autorun'
require '../trapping_rain_water'

describe 'p' do

  it 'should work' do
    t([0,1,0,2,1,0,1,3,2,1,2,1]).must_equal(6)
  end

end
