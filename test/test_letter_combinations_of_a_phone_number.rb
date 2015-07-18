require 'minitest/autorun'
require '../letter_combinations_of_a_phone_number'

describe 'letter_combinations(digits)' do
  it 'should work' do
    digits = '23'
    expected_result = ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
    letter_combinations(digits).must_equal(expected_result)
  end

  it 'should work' do
    digits = '29'
    expected_result = ["aw", "ax", "ay", "az", "bw", "bx", "by", "bz", "cw", 
      "cx", "cy", "cz"]
    letter_combinations(digits).must_equal(expected_result)
  end

  it 'should work' do
    digits = '234'
    expected_result = ["adg","adh","adi","aeg","aeh","aei","afg","afh","afi",
      "bdg","bdh","bdi","beg","beh","bei","bfg","bfh","bfi","cdg","cdh","cdi",
      "ceg","ceh","cei","cfg","cfh","cfi"]
    letter_combinations(digits).must_equal(expected_result)
  end
end
