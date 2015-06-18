require 'minitest/autorun'
require '../text_justification'

describe 'full_justify' do
  it 'should pass test1' do
    words = ["This", "is", "an", "example", "of", "text", "justification."]
    max_width = 16
    expected_result = [
      "This    is    an",
      "example  of text",
      "justification.  "
    ]
    full_justify(words, max_width).must_equal(expected_result)
  end

  it 'should pass test2' do
    words = [""]
    max_width = 0
    expected_result = [
      ""
    ]
    full_justify(words, max_width).must_equal(expected_result)
  end

  it 'should pass test3' do
    words = ["a"]
    max_width = 1
    expected_result = [
      "a"
    ]
    full_justify(words, max_width).must_equal(expected_result)
  end

  it 'should pass test4' do
    words = ["What","must","be","shall","be."]
    max_width = 12
    expected_result = ["What must be","shall be.   "]
    full_justify(words, max_width).must_equal(expected_result)
  end

  it 'should pass test5' do
    words = ["Don't","go","around","saying","the","world","owes","you",
             "a","living;","the","world","owes","you","nothing;","it",
             "was","here","first."]
    max_width = 30
    expected_result = [
      "Don't  go  around  saying  the",
      "world  owes  you a living; the",
      "world owes you nothing; it was",
      "here first.                   "
    ]
    full_justify(words, max_width).must_equal(expected_result)
  end

  it 'should pass test6' do
    words = ["Listen","to","many,","speak","to","a","few."]
    max_width = 6
    expected_result = ["Listen","to    ","many, ","speak ","to   a","few.  "]
    full_justify(words, max_width).must_equal(expected_result)
  end
end
